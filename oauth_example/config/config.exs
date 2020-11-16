# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :oauth_example,
  ecto_repos: [OauthExample.Repo]

# Configures the endpoint
config :oauth_example, OauthExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I9sKx9rM7QtzIGheQsS7oGw59WU8j0D/PjSFtNxbA/rNkJ0vhpIm5ux/zWNcOrdb",
  render_errors: [view: OauthExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OauthExample.PubSub,
  live_view: [signing_salt: "tTYPuNR2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []},
    discord: {Ueberauth.Strategy.Discord, [default_scope: "identify email"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "8384efc80b70933ee625",
  client_secret: "fe67cd4d9c16eebeeaf93df075b11dcf05b86ee1"

config :ueberauth, Ueberauth.Strategy.Discord.OAuth,
  client_id: "777855488633077780",
  client_secret: "DR6veMlNOso6aipnqOGxuuLmhqkg348H"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
