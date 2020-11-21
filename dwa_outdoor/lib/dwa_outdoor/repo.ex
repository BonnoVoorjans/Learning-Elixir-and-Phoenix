defmodule DwaOutdoor.Repo do
  use Ecto.Repo,
    otp_app: :dwa_outdoor,
    adapter: Ecto.Adapters.Postgres
end
