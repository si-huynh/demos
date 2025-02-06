//
//  CreateUser.swift
//  backend
//
//  Created by Sĩ Huỳnh on 5/2/25.
//

import Fluent

struct CreateUser: Migration {
  func prepare(on database: any Database) -> EventLoopFuture<Void> {
    database.enum(User.v20250502.userType)
      .case(User.v20250502.userTypeAdmin)
      .case(User.v20250502.userTypeStandard)
      .case(User.v20250502.userRestricted)
      .create()
      .flatMap { userType in
        database.schema(User.v20250502.schemaName)
          .id()
          .field(User.v20250502.firstName, .string, .required)
          .field(User.v20250502.lastName, .string, .required)
          .field(
            FieldKey(stringLiteral: User.v20250502.userType),
            userType,
            .required
          )
          .field(User.v20250502.password, .string, .required)
          .field(User.v20250502.email, .string, .required)
          .field(User.v20250502.deletedAt, .datetime)
          .unique(on: User.v20250502.email)
          .create()
      }
  }

  func revert(on database: any Database) -> EventLoopFuture<Void> {
    database.schema(User.v20250502.schemaName).delete()
  }
}

extension User {
  enum v20250502 {
    static let schemaName = "users"

    static let id = FieldKey(stringLiteral: "id")
    static let firstName = FieldKey(stringLiteral: "firstName")
    static let lastName = FieldKey(stringLiteral: "lastName")
    static let password = FieldKey(stringLiteral: "password")
    static let email = FieldKey(stringLiteral: "email")
    static let deletedAt = FieldKey(stringLiteral: "deletedAt")

    static let userType = "userType"
    static let userTypeAdmin = UserType.admin.rawValue
    static let userTypeStandard = UserType.standard.rawValue
    static let userRestricted = UserType.restricted.rawValue
  }
}
