defmodule LiveViewStudioWeb.FilterLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Boats

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        boats: Boats.list_boats(),
        type: "",
        prices: []
      )

    {:ok, socket, temporary_assigns: [boats: []]} #Saves memory, by resetting boats to empty list after rendering
  end

  defp type_options do
  [
    "All Types": "",
    Fishing: "fishing",
    Sporting: "sporting",
    Sailing: "sailing"
  ]
  end

  def handle_event("filter", %{"type" => selected_type, "prices" => prices}, socket) do
    params = [type: selected_type, prices: prices]
    boats = Boats.list_boats(params)
    socket = assign(socket, params ++ [boats: boats])
    {:noreply, socket}
  end

  defp price_checkbox(assigns) do
  assigns = Enum.into(assigns, %{})
    ~L"""
    <input type="checkbox" id="<%= @price %>"
           name="prices[]" value="<%= @price %>"
           <%= if @checked, do: "checked" %>/>
           <label for="<%= @price %>"><%= @price %></label>
    """
  end
end
