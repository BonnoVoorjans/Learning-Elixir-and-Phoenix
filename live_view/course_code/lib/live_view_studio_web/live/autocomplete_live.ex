defmodule LiveViewStudioWeb.AutocompleteLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.Stores
  alias LiveViewStudio.Cities

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        zip: "",
        city: "",
        stores: [],
        matches: [],
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

  def handle_event("search-by-city", %{"city-search" => city}, socket) do
    send(self(), {:search_for_city, city})

    socket =
      assign(socket,
        city: city,
        stores: [],
        loading: true
      )

    {:noreply, socket}
  end

  def handle_event("find-matching-cities", %{"city" => substring}, socket) do
    socket = assign(socket, matches: Cities.suggest(substring))
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

  def handle_info({:search_for_city, city}, socket) do
    case Stores.search_by_city(city) do
      [] ->
        socket =
          socket
          |> put_flash(:info, "No stores matching \"#{city}\"")
          |> assign(stores: [], loading: false)

        {:noreply, socket}

      stores ->
        socket = assign(socket, stores: stores, loading: false)
        {:noreply, socket}
    end
  end
end
