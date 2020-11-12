# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dwa_fitness,
  ecto_repos: [DwaFitness.Repo]

# Configures the endpoint
config :dwa_fitness, DwaFitnessWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "z+FDE+WkndspNa4yD1URzVDZch8dFiIsjmADLiFEedn4tS/Yz2cu+J3GQUPpMjnj",
  render_errors: [view: DwaFitnessWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DwaFitness.PubSub,
  live_view: [signing_salt: "DbY9DQ/T"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
