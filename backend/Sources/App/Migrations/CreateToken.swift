// Created by Sĩ Huỳnh on 5/2/25.

import Fluent

struct CreateToken: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Token.v20250502.schemaName)
            .id()
            .field(Token.v20250502.value, .string, .required)
            .field(
                Token.v20250502.userID, .uuid, .required,
                .references(User.v20250502.schemaName, User.v20250502.id, onDelete: .cascade)
            )
            .create()
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        return database.schema(Token.v20250502.schemaName).delete()
    }
}

extension Token {
    enum v20250502 {
        static let schemaName = "tokens"

        static let value = FieldKey(stringLiteral: "value")
        static let userID = FieldKey(stringLiteral: "userID")
    }
}
