# defmodule DwaFitnessWeb.AuthenticatePlug do
# import Authenticator

#   def authenticate(conn, _) do
#     case Authenticator.find_user(conn) do
#       {:ok, user} ->
#       assign(conn, :user, user)
#       :error ->
#       conn |> put_flash(:info, "You must be logged in") |> redirect(to: "/") |> halt()
#     end
#   end
    
#   def fetch_message(conn, _) do
#     case find_message(conn.params["id"]) do
#       nil ->
#         conn |> put_flash(:info, "That message wasn't found") |> redirect(to: "/") |> halt()
#       message ->
#         assign(conn, :message, message)
#     end
#   end
    
#   def authorize_message(conn, _) do
#     if Authorizer.can_access?(conn.assigns[:user], conn.assigns[:message]) do
#       conn
#     else
#       conn |> put_flash(:info, "You can't access that page") |> redirect(to: "/") |> halt()
#     end
#   end
# end 