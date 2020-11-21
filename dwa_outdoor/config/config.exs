# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dwa_outdoor,
  ecto_repos: [DwaOutdoor.Repo]

# Configures the endpoint
config :dwa_outdoor, DwaOutdoorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TQvwbdSUP8ObVqnJ3EEjDK/ONt95+YV/JQA2uZVyt6WD2xYXC0KEeNlG9XfUD4VV",
  render_errors: [view: DwaOutdoorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DwaOutdoor.PubSub,
  live_view: [signing_salt: "PpE32FLP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
