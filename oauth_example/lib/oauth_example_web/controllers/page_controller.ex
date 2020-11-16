defmodule OauthExampleWeb.PageController do
  use OauthExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", session_info: get_session(conn, :user_id))
  end
end
