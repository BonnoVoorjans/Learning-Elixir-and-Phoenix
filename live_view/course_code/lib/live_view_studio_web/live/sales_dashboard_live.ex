defmodule LiveViewStudioWeb.SalesDashboardLive do
  use LiveViewStudioWeb, :live_view

  alias LiveViewStudio.RandomNumbers

  def mount(_params, _session, socket) do
    if connected?(socket) do #Start interval on the second mount call, when socket is connected
      :timer.send_interval(1000, self(), :timed_event) #since its a different process from the first mount call
    end

    socket = assign_stats(socket)

    {:ok, socket}
  end

  def handle_event("refresh", _, socket) do
    socket = assign_stats(socket)
    {:noreply, socket}
  end

  def handle_info(:timed_event, socket) do
    socket = assign_stats(socket)
    {:noreply, socket}
  end

  defp assign_stats(socket) do
    assign(socket,
      new_orders: RandomNumbers.generate_random_number(5, 20),
      sales_amount: RandomNumbers.generate_random_number(100, 1000),
      satisfaction: RandomNumbers.generate_random_number(60, 100)
    )
  end
end
