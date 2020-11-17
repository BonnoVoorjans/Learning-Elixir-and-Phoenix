defmodule OauthExampleWeb.ChatController do
  use OauthExampleWeb, :controller

  def index(conn, _params) do
    if(conn.assigns[:user]) do
      render(conn, "index.html")
    else
      conn
      |> put_flash(:error, "You need to be logged in to chat")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
