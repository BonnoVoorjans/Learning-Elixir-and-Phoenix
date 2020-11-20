defmodule LiveViewStudioWeb.SearchLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Stores

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        zip: "",
        stores: [],
        loading: false
      )

    {:ok, socket}
  end

  def handle_event("search-by-zip", %{"zip-search" => zip}, socket) do
    send(self(), {:search_for_zip, zip})

    socket =
      assign(socket,
        zip: zip,
        stores: [],
        loading: true
      )

    {:noreply, socket}
  end

  def handle_info({:search_for_zip, zip}, socket) do
    case Stores.search_by_zip(zip) do
      [] ->
        socket =
          socket
          |> put_flash(:info, "No stores matching \"#{zip}\"")
          |> assign(stores: [], loading: false)

        {:noreply, socket}

      stores ->
        socket = assign(socket, stores: stores, loading: false)
        {:noreply, socket}
    end
  end
end
