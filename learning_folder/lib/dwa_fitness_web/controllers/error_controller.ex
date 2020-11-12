defmodule DwaFitnessWeb.MyFallbackController do #A plug for error handling that can be used anywhere
    use Phoenix.Controller                      #Usage can be seen in MyController
  
    def call(conn, {:error, :not_found}) do
      conn
      |> put_status(:not_found)
      |> put_view(DwaFitnessWeb.ErrorView)
      |> render(:"404")
    end
  
    def call(conn, {:error, :unauthorized}) do
      conn
      |> put_status(403)
      |> put_view(DwaFitnessWeb.ErrorView)
      |> render(:"403")
    end
  end