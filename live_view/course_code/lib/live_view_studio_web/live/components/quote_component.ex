defmodule LiveViewStudioWeb.QuoteComponent do
  use LiveViewStudioWeb, :live_component

  import Number.Currency

  def mount(socket) do
    {:ok, assign(socket, hrs_until_expires: 24)}
  end

  # def update(assigns, socket) do
  #   socket = assign(socket, assigns)
  #   {:ok, socket}
  # end

end
