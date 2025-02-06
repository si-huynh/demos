// Created by Sĩ Huỳnh on 5/2/25.

import Fluent
import JWT
import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let usersRoute = routes.grouped("api", "users")
        usersRoute.get(use: getAllHandler)
        usersRoute.get(":userId", use: getHandler)
        usersRoute.post("register", use: registerHandler)
        // usersRoute.post("login", use: loginHandler)

        let basicAuthMiddleware = User.authenticator()
        let basicAuthGroup = usersRoute.grouped(basicAuthMiddleware)
        basicAuthGroup.post("login", use: loginHandler)

        let tokenAuthMiddleware = Token.authenticator()
        let guardAuthMiddleware = User.guardMiddleware()
        let tokenAuthGroup = usersRoute.grouped(tokenAuthMiddleware, guardAuthMiddleware)
        tokenAuthGroup.delete(":userId", use: deleteHandler)
        tokenAuthGroup.delete(":userId", "force", use: forceDeleteHandler)
        tokenAuthGroup.post(":userId", "restore", use: restoreHandler)
        tokenAuthGroup.get("me", use: getMeHandler)
        tokenAuthGroup.post("logout", use: logoutHandler)
    }

    @Sendable
    func registerHandler(_ req: Request) async throws -> Response {
        let user = try req.content.decode(User.self)
        user.password = try Bcrypt.hash(user.password)
        try await user.save(on: req.db)
        let token = try Token.generate(for: user)
        try await token.save(on: req.db)
        let response = ["data": token]
        return try await response.encodeResponse(for: req)
    }

    @Sendable
    func getMeHandler(_ req: Request) async throws -> User.Public {
        let user = try req.auth.require(User.self)

        return user.convertToPublic()
    }

    @Sendable
    func getAllHandler(_ req: Request) async throws -> [User.Public] {
        let users = try await User.query(on: req.db).all()
        return users.map { $0.convertToPublic() }
    }

    @Sendable
    func loginHandler(_ req: Request) async throws -> Response {
        let data = try req.auth.require(User.self)
        let token = try Token.generate(for: data)

        try await token.save(on: req.db)

        let response = ["data": token]
        return try await response.encodeResponse(for: req)
    }

    @Sendable
    func getHandler(_ req: Request) async throws -> User.Public {
        guard let userId = req.parameters.get("userId", as: UUID.self),
            let user = try await User.find(userId, on: req.db)
        else {
            throw Abort(.notFound)
        }
        return user.convertToPublic()
    }

    @Sendable
    func deleteHandler(_ req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(User.self)
        guard user.userType == .admin else {
            throw Abort(.forbidden)
        }

        guard let user = try await User.find(req.parameters.get("userId"), on: req.db) else {
            throw Abort(.notFound)
        }

        do {
            try await user.delete(on: req.db)
            return .noContent
        } catch {
            throw Abort(.internalServerError)
        }
    }

    @Sendable
    func forceDeleteHandler(_ req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(User.self)
        guard user.userType == .admin else {
            throw Abort(.forbidden)
        }

        guard let user = try await User.find(req.parameters.get("userId"), on: req.db) else {
            throw Abort(.notFound)
        }

        do {
            try await user.delete(on: req.db)
            return .noContent
        } catch {
            throw Abort(.internalServerError)
        }
    }

    @Sendable
    func restoreHandler(_ req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(User.self)
        guard user.userType == .admin else {
            throw Abort(.forbidden)
        }

        guard let user = try await User.find(req.parameters.get("userId"), on: req.db) else {
            throw Abort(.notFound)
        }

        do {
            try await user.restore(on: req.db)
            return .noContent
        } catch {
            throw Abort(.internalServerError)
        }
    }

    @Sendable
    func logoutHandler(_ req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(User.self)
        guard let userId = user.id else {
            throw Abort(.internalServerError)
        }
        try await Token.query(on: req.db).filter(\.$user.$id == userId).delete()
        return .noContent
    }
}
