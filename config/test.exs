use Mix.Config

# Configure your database
config :kahoot, Kahoot.Repo,
  username: "postgres",
  password: "postgres",
  database: "kahoot_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :kahoot, KahootWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
