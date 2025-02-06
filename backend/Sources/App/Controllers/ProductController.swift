//
//  ProductController.swift
//  App
//
//  Created by Si Huynh on 2025/02/06.
//

import Fluent
import Vapor

struct ProductController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let products = routes.grouped("api", "products")
        products.get(use: getAllHandler)
        products.get(":productId", use: getHandler)
    }

    @Sendable
    func getAllHandler(_ req: Request) async throws -> Response {
        let products = try await Product.query(on: req.db).all()
        let response = ["data": products]
        return try await response.encodeResponse(for: req)
    }

    @Sendable
    func getHandler(_ req: Request) async throws -> Response {
        let productId = req.parameters.get("productId", as: UUID.self)
        let product = try await Product.find(productId, on: req.db)
        guard let product = product else {
            throw Abort(.notFound)
        }
        let response = ["data": product]
        return try await response.encodeResponse(for: req)
    }
}
