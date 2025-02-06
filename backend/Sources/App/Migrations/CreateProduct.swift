//
//  CreateProduct.swift
//  App
//
//  Created by Si Huynh on 2025/02/06.
//

import Fluent

struct CreateProduct: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("products")
            .id()
            .field(Product.name, .string, .required)
            .field(Product.price, .int, .required)
            .field(Product.stock, .int, .required)
            .field(Product.createdAt, .date, .required)
            .field(Product.updatedAt, .date, .required)
            .field(Product.image, .string, .required)
            .field(Product.description, .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("products").delete()
    }
}

extension Product {
    static let schemaName = "products"

    static let id = FieldKey(stringLiteral: "id")
    static let name = FieldKey(stringLiteral: "name")
    static let price = FieldKey(stringLiteral: "price")
    static let stock = FieldKey(stringLiteral: "stock")
    static let createdAt = FieldKey(stringLiteral: "created_at")
    static let updatedAt = FieldKey(stringLiteral: "updated_at")
    static let image = FieldKey(stringLiteral: "image")
    static let description = FieldKey(stringLiteral: "description")
}
