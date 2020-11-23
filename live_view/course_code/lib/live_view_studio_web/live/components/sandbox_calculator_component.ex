defmodule LiveViewStudioWeb.SandboxCalculatorComponent do
  use LiveViewStudioWeb, :live_component

  alias LiveViewStudio.SandboxCalculator

  def mount(socket) do
    {:ok, assign(socket, length: nil, width: nil, depth: nil, weight: 0)}
  end

  # def update(assigns, socket) do
  #   {:ok, assign(socket, assigns)}
  # end

  def handle_event("calculate", params, socket) do
    %{"length" => l, "width" => w, "depth" => d} = params

    weight = SandboxCalculator.calculate_weight(l, w, d)

    socket =
      assign(socket,
        length: l,
        width: w,
        depth: d,
        weight: weight
      )

    {:noreply, socket}
  end

  def handle_event("get-quote", _, socket) do
    weight = socket.assigns.weight
    price = SandboxCalculator.calculate_price(weight)

    send(self(), {:totals, weight, price})

    {:noreply, socket}
  end
end
