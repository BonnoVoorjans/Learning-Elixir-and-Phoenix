# defmodule DwaFitnessWeb.MyController do
#     use Phoenix.Controller
#
#     action_fallback HelloWeb.MyFallbackController          #When "with" conditions dont match (ok for both fetch_post and authorize_user
#                                                            #Error controller will take over and open correct error page 
#     def show(conn, %{"id" => id}, current_user) do
#       with {:ok, post} <- fetch_post(id),                        #If any aren't OK, enter else block
#            :ok <- authorize_user(current_user, :view, post) do 
#         render(conn, "show.json", post: post)
#       end
#     end
#   end