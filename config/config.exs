# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :realtimeapp,
  ecto_repos: [Realtimeapp.Repo]

# Configures the endpoint
config :realtimeapp, RealtimeappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K/2aPTAvWSz0dHQuXLFfuFrs4P5bl3oSQB7TjB/yNXoIul1jL7MRi+z8FJrV3Qeu",
  render_errors: [view: RealtimeappWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Realtimeapp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
