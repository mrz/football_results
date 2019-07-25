# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :football_results,
  ecto_repos: [FootballResults.Repo]

# Configures the endpoint
config :football_results, FootballResultsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AiZUYHK4XLhkpbs1azRQmBxiL7SASWVct19RGrthLi+Tx/6DIunVUqP4Q00oUpyS",
  render_errors: [view: FootballResultsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FootballResults.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
