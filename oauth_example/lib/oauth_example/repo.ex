defmodule OauthExample.Repo do
  use Ecto.Repo,
    otp_app: :oauth_example,
    adapter: Ecto.Adapters.Postgres
end
