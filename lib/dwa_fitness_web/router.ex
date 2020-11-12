defmodule DwaFitnessWeb.Router do
  @crud_modifier [:index, :update, :create, :delete, :show]
  use DwaFitnessWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DwaFitnessWeb.Plugs.Locale, "nl"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

#scoped route, for when e.g. an admin needs to approve reviews. None functional code
#use as: :admin for correct path-helper
#   scope "/admin", HelloWeb.Admin, as: :admin do 
#     pipe_through :browser
#     resources "/reviews", ReviewController
# end

  scope "/", DwaFitnessWeb do
    pipe_through :browser #If you want to pipe through multiple pipelines, use a list [:browser, :authenticate, :do_things]

    get "/", PageController, :index
    # resources "/users", UserController, only: @crud_modifier do  #Nested resources, a user can have many posts
    #   resources "/posts", PostController                         #but a post belongs to one user
    #end
    get "/hello", HelloController, :index
    get "/hello/:name", HelloController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", DwaFitnessWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: DwaFitnessWeb.Telemetry
    end
  end
end
