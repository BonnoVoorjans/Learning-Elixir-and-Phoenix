defmodule OauthExample.Accounts.Authuser do
  use Ecto.Schema
  import Ecto.Changeset
  alias OauthExample.Accounts.User

    @primary_key {:email, :string, []}
    @derive {Phoenix.Param, key: :email}

  schema "authusers" do
    field :provider, :string
    field :token, :string
    has_one :user, User, [foreign_key: :email, references: :email]

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:provider, :token, :email])
    |> validate_required([:provider, :token, :email])
  end
end
