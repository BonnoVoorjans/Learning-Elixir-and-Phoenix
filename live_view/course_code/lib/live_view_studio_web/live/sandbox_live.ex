defmodule LiveViewStudioWeb.SandboxLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudioWeb.QuoteComponent
  alias LiveViewStudioWeb.SandboxCalculatorComponent

  def mount(_params, _session, socket) do
    {:ok, assign(socket, weight: nil, price: nil)}
  end

  def handle_info({:totals, weight, price}, socket) do
    socket = assign(socket, weight: weight, price: price)
    {:noreply, socket}
  end
end
