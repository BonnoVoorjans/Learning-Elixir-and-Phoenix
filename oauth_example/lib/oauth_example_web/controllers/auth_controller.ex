defmodule OauthExampleWeb.AuthController do
  use OauthExampleWeb, :controller
    alias OauthExample.Repo
  plug Ueberauth

  alias OauthExample.Accounts.{Authuser, User}

    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
      user_params = %{
        token: auth.credentials.token, 
        email: auth.info.email, 
        provider: params["provider"]
      }
     
      user_changeset = User.changeset(%User{}, %{email: auth.info.email})
      authuser_changeset = Authuser.changeset(%Authuser{}, user_params)
      IO.puts("+++++++++++++++++++")
      IO.inspect(authuser_changeset)
      signin(conn, user_changeset, authuser_changeset)
      
    end

    defp signin(conn, user_changeset, authuser_changeset) do
    IO.inspect(authuser_changeset)
    IO.puts("++++++++++++++++++")
      case insert_user_if_not_exists(user_changeset) do
        {:ok, user} ->
          case insert_or_update_authuser(authuser_changeset) do
            {:ok, authuser} -> 
              conn
              |> put_flash(:info, "Logged in succesfully!")
              |> put_session(:user_id, user.email)
              |> redirect(to: Routes.page_path(conn, :index))
            {:error, _reason} ->
              conn
              |> put_flash(:error, "Error signing in")
              |> redirect(to: Routes.page_path(conn, :index))
          end
        {:error, _} ->
          conn
          |> put_flash(:error, "Error signing in")
          |> redirect(to: Routes.page_path(conn, :index))  
      end
    end

    defp insert_user_if_not_exists(changeset) do
      case Repo.get_by(User, email: changeset.changes.email) do
        nil -> 
          Repo.insert(changeset)
        user -> 
          {:ok, user}
      end
    end

    defp insert_or_update_authuser(changeset) do
      case Repo.get_by(Authuser, email: changeset.changes.email) do
        nil-> 
          Repo.insert(changeset)
        authuser ->
        {:ok, authuser}
      end
    end
end