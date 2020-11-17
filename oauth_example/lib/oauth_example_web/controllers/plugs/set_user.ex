defmodule OauthExampleWeb.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias OauthExample.Repo
    alias OauthExample.Accounts.User

     def init(_params) do
     end

     def call(conn, _params) do #2nd arg is return value of init
        user_id = get_session(conn, :user_id)

        cond do
            user = user_id && Repo.get_by(User, external_id: user_id) ->
                assign(conn, :user, user)
            true ->
                assign(conn, :user, nil)
        end
     end
end