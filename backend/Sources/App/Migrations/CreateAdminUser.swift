// Created by Sĩ Huỳnh on 5/2/25.

import Fluent
import Vapor

struct CreateAdminUser: Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        let password = try! Bcrypt.hash("password")
        let user = User(
            userType: .admin,
            firstName: "System",
            lastName: "Admin",
            password: password,
            email: "admin@example.com"
        )

        return user.save(on: database)
    }

    func revert(on database: any Database) -> EventLoopFuture<Void> {
        User.query(on: database).filter(\.$email == "admin@example.com").delete()
    }
}
