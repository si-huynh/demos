// Created by Sĩ Huỳnh on 5/2/25.

import Fluent
import Vapor

final class Token: Model, Content, @unchecked Sendable {
    static let schema = Token.v20250502.schemaName

    @ID(key: .id)
    var id: UUID?

    @Field(key: Token.v20250502.value)
    var value: String

    @Parent(key: Token.v20250502.userID)
    var user: User

    init() {}

    init(id: UUID? = nil, value: String, userID: User.IDValue) {
        self.id = id
        self.value = value
        self.$user.id = userID
    }
}

extension Token {
    static func generate(for user: User) throws -> Token {
        let value = [UInt8].random(count: 16).base64
        return try Token(value: value, userID: user.requireID())
    }
}

extension Token: ModelTokenAuthenticatable {
    static let valueKey = \Token.$value
    static let userKey = \Token.$user

    var isValid: Bool {
        true
    }

    typealias User = App.User
}
