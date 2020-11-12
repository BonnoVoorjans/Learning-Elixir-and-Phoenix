defmodule DwaFitnessWeb.PageController do
  use DwaFitnessWeb, :controller

  # def index(conn, _params) do #Load index without layout (app.html.eex)
  #   conn
  #   |> put_layout(false)
  #   |>render("index.html")
  # end
 
  # def index(conn, _params) do
  #   conn
  #   |> put_layout("admin.html")      using custom layout of admin.html for pagecontroller when requesting index
  #   |> render("index.html")
  # end

  # def index(conn, _params) do        #for sending custom error codes without body
#   conn
#   |> put_resp_content_type("text/plain")
#   |> send_resp(201, "")
# end

# def index(conn, _params) do       #Setting content type to xml e.g. must provide index.xml.eex template with valid xml.
#   conn
#   |> put_resp_content_type("text/xml")
#   |> render("index.xml", content: some_xml_content)
# end


  # def index(conn, _params) do
  #   #Can add HTTP status through piping con into
  #   #|> put_status(202)
  #   #|> render("index.html")
  #   #render(conn, :index)
  #   redirect(conn, to: Routes.page_path(conn, :redirect_test))
  #   #external pages can be redirected to through external: instead of to:
  # end

  #Phoenix provides flash messages for communication DURING actions. 
  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> redirect(to: Routes.page_path(conn, :redirect_test))
  end
  
  #Redirects to
  def redirect_test(conn, _params) do
    render(conn, "index.html")
  end
  
end