defmodule OauthExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      OauthExample.Repo,
      # Start the Telemetry supervisor
      OauthExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: OauthExample.PubSub},
      # Start the Endpoint (http/https)
      OauthExampleWeb.Endpoint
      # Start a worker by calling: OauthExample.Worker.start_link(arg)
      # {OauthExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OauthExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    OauthExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
