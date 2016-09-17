use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :user_api, UserApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :user_api, UserApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "user_api",
  password: "pwd",
  database: "user_api_test",
  pool: Ecto.Adapters.SQL.Sandbox
