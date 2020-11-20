defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10) #set default of state-variables
    {:ok, socket} #always return tuple
  end

  def handle_event("turn_on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("brighten", _, socket) do
    socket = update(socket, :brightness, &(&1 + 10))
    {:noreply, socket}
  end

  def handle_event("dim", _, socket) do
    socket = update(socket, :brightness, &(&1 - 10))
    {:noreply, socket}
  end

  def handle_event("turn_off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("update", %{"brightness" => brightness}, socket) do
  socket = assign(socket, :brightness, brightness)
  {:noreply, socket}
  end
end
