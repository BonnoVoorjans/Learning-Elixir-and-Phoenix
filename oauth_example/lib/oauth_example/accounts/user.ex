defmodule OauthExample.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:email, :string, []}
  @derive {Phoenix.Param, key: :email}

  schema "users" do
    field :name, :string
    field :username, :string
    field :external_id, Ecto.UUID, autogenerate: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :username])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
