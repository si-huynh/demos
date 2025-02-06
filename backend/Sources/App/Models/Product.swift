//
//  Product.swift
//  App
//
//  Created by Si Huynh on 2025/02/06.
//

import Fluent
import Vapor

final class Product: Model, Content, @unchecked Sendable {
    static let schema: String = Product.schemaName

    @ID
    var id: UUID?

    @Field(key: Product.name)
    var name: String

    @Field(key: Product.description)
    var description: String

    @Field(key: Product.price)
    var price: Int

    @Field(key: Product.stock)
    var stock: Int

    @Timestamp(key: Product.createdAt, on: .create)
    var createdAt: Date?

    @Timestamp(key: Product.updatedAt, on: .update)
    var updatedAt: Date?

    @Field(key: Product.image)
    var image: String?

    init() {}

    init(
        id: UUID? = nil, name: String, description: String, price: Int, stock: Int,
        image: String? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
        self.image = image
    }
}
