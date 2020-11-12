defmodule DwaFitnessWeb.HelloController do
  use DwaFitnessWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"name" => name} = params) do
    #You can render through the use of "text/2, json/2, html/2 or render/3
    #parameters can also be assigned through Plug.Conn.assign (or just assign). This returns conn.
    #conn
    #|> assign(:messenger, name)
    #|>assign(:receiver, "The Receiver")
    #|> render("show.html")
    render(conn, "show.html", name: name)
  end
end