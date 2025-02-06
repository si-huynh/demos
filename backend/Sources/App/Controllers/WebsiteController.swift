// Created by Sĩ Huỳnh on 5/2/25.

import Fluent
import Leaf
import Vapor

struct WebsiteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let authSessionRoutes = routes.grouped(User.sessionAuthenticator())
        authSessionRoutes.get("login", use: loginHandler)

        let credentialsAuthRoutes = routes.grouped(User.credentialsAuthenticator())
        credentialsAuthRoutes.post("login", use: loginPostHandler)

        authSessionRoutes.get("register", use: registerHandler)
        authSessionRoutes.post("register", use: registerPostHandler)

        let protectedRoutes = authSessionRoutes.grouped(User.redirectMiddleware(path: "/login"))
        protectedRoutes.get("users", use: allUsersHandler)
        protectedRoutes.get(use: indexHandler)
    }

    @Sendable
    func indexHandler(_ req: Request) async throws -> View {
        let showCookieMessage = req.cookies["cookies-accepted"] == nil
        let userLoggedIn = req.auth.has(User.self)
        let context = IndexContext(
            showCookieMessage: showCookieMessage,
            userLoggedIn: userLoggedIn
        )
        return try await req.view.render("index", context)
    }

    @Sendable
    func loginHandler(_ req: Request) async throws -> Response {
        let context: LoginContext
        if let error = req.query[Bool.self, at: "error"] {
            context = LoginContext(loginError: error)
        } else {
            context = LoginContext(loginError: nil)
        }

        let response = try await req.view.render("login", context).encodeResponse(for: req).get()
        return response
    }

    @Sendable
    func loginPostHandler(_ req: Request) async throws -> Response {
        if req.auth.has(User.self) {
            return req.redirect(to: "/")
        } else {
            let context = LoginContext(loginError: true)
            let response = try await req.view.render("login", context).encodeResponse(for: req)
                .get()
            return response
        }
    }

    @Sendable
    func allUsersHandler(_ req: Request) async throws -> View {
        let users = try await User.query(on: req.db).all()
        let context = AllUsersContext(users: users)
        return try await req.view.render("allUsers", context)
    }

    @Sendable
    func registerHandler(_ req: Request) async throws -> Response {
        let context: RegisterContext
        if let message = req.query[String.self, at: "message"] {
            context = RegisterContext(message: message)
        } else {
            context = RegisterContext(message: nil)
        }
        let response = try await req.view.render("register", context).encodeResponse(for: req).get()
        return response
    }

    @Sendable
    func registerPostHandler(_ req: Request) async throws -> Response {
        do {
            try RegisterData.validate(content: req)
        } catch let error as ValidationsError {
            let message =
                error.description.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                ?? "Unknown error"
            return req.redirect(to: "/register?message=\(message)")
        }

        let data = try req.content.decode(RegisterData.self)
        let password = try Bcrypt.hash(data.password)
        let user = User(
            firstName: data.firstName,
            lastName: data.lastName,
            password: password,
            email: data.emailAddress
        )
        try await user.save(on: req.db)

        guard user.id != nil else {
            throw Abort(.internalServerError)
        }

        req.auth.login(user)

        return req.redirect(to: "/")
    }
}

struct LoginContext: Encodable {
    let title = "Log In"
    let loginError: Bool?

    init(loginError: Bool?) {
        self.loginError = loginError
    }
}

struct AllUsersContext: Encodable {
    let title = "All Users"
    let users: [User]

    init(users: [User]) {
        self.users = users
    }
}

struct IndexContext: Encodable {
    let title = "Home"
    let showCookieMessage: Bool
    let userLoggedIn: Bool

    init(showCookieMessage: Bool, userLoggedIn: Bool) {
        self.showCookieMessage = showCookieMessage
        self.userLoggedIn = userLoggedIn
    }
}

struct RegisterContext: Encodable {
    let title = "Register"
    let message: String?

    init(message: String?) {
        self.message = message
    }
}

struct RegisterData: Content {
    let firstName: String
    let lastName: String
    let password: String
    let emailAddress: String
    let confirmPassword: String
}

extension RegisterData: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("firstName", as: String.self, is: .ascii)
        validations.add("lastName", as: String.self, is: .ascii)
        validations.add("emailAddress", as: String.self, is: .email)
        validations.add("password", as: String.self, is: .count(6...24))
        validations.add("confirmPassword", as: String.self, is: .count(6...24))
    }
}
