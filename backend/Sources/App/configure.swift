import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
  // uncomment to serve files from /Public folder
  app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
  app.middleware.use(app.sessions.middleware)
  app.views.use(.leaf)

  let postgresConfiguration: SQLPostgresConfiguration = .init(
    hostname: Environment.get("DATABASE_HOST") ?? "localhost",
    username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
    password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
    database: Environment.get("DATABASE_NAME") ?? "vapor_database",
    tls: .prefer(try .init(configuration: .clientDefault))
  )

  app.databases
    .use(
      .postgres(configuration: postgresConfiguration),
      as: .psql
    )

  app.migrations.add(CreateUser())
  app.migrations.add(CreateToken())
  app.migrations.add(CreateProduct())
  switch app.environment {
  case .development:
    app.migrations.add(CreateAdminUser())
    app.migrations.add(CreateMockedProduct())
    app.logger.logLevel = .debug
  default:
    break
  }

  app.databases.middleware.use(UserMiddleware(), on: .psql)

  try await app.autoMigrate()

  // register routes
  try routes(app)
}
