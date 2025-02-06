//
//  User.swift
//  backend
//
//  Created by Sĩ Huỳnh on 5/2/25.
//

import Fluent
import Vapor

final class User: Model, Content, @unchecked Sendable {

  static let schema: String = "users"

  @ID
  var id: UUID?

  @Enum(key: FieldKey(stringLiteral: User.v20250502.userType))
  var userType: UserType

  @Field(key: User.v20250502.firstName)
  var firstName: String

  @Field(key: User.v20250502.lastName)
  var lastName: String

  @Field(key: User.v20250502.password)
  var password: String

  @Field(key: User.v20250502.email)
  var email: String

  @Timestamp(key: User.v20250502.deletedAt, on: .delete)
  var deletedAt: Date?

  init() {}

  init(
    id: UUID? = nil,
    userType: UserType = .standard,
    firstName: String,
    lastName: String,
    password: String,
    email: String,
    deletedAt: Date? = nil
  ) {
    self.id = id
    self.userType = userType
    self.firstName = firstName
    self.lastName = lastName
    self.password = password
    self.email = email
    self.deletedAt = deletedAt
  }

  final class Public: Content {
    let id: UUID?
    let firstName: String
    let lastName: String
    let email: String
    let userType: UserType

    init(id: UUID?, firstName: String, lastName: String, email: String, userType: UserType) {
      self.id = id
      self.firstName = firstName
      self.lastName = lastName
      self.email = email
      self.userType = userType
    }
  }
}

extension User {
  func convertToPublic() -> User.Public {
    User.Public(id: id, firstName: firstName, lastName: lastName, email: email, userType: userType)
  }
}

extension User: ModelAuthenticatable {
  static let usernameKey = \User.$email
  static let passwordHashKey = \User.$password

  func verify(password: String) throws -> Bool {
    try Bcrypt.verify(password, created: self.password)
  }
}

extension User: ModelSessionAuthenticatable {}
extension User: ModelCredentialsAuthenticatable {}

// curl --location --request POST 'http://localhost:8080/api/users/login' \
// --header 'Authorization: Basic YWRtaW5AZXhhbXBsZS5jb206cGFzc3dvcmQ='
