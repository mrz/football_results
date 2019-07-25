use Mix.Config

# Configure your database
config :football_results, FootballResults.Repo,
  username: "postgres",
  password: "postgres",
  database: "football_results_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :football_results, FootballResultsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
