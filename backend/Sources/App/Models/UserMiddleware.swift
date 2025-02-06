// Created by Sĩ Huỳnh on 5/2/25.

import Fluent
import Vapor

struct UserMiddleware: ModelMiddleware {
    func create(model: User, on db: any Database, next: any AnyModelResponder) -> EventLoopFuture<
        Void
    > {
        User.query(on: db).filter(\.$email == model.email).count().flatMap { count in
            if count > 0 {
                return db.eventLoop.future(
                    error: Abort(.badRequest, reason: "Email already exists"))
            }
            return next.create(model, on: db)
        }
    }
}
