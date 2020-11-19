defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view
  alias LiveViewStudio.LicenseCalculator
  import Number.Currency

  def mount(_params, _session, socket) do
    socket = assign(socket, seats: 3, amount: LicenseCalculator.calc(3))
    {:ok, socket}
  end


  def handle_event("change_slider", %{"number_of_seats" => seats}, socket) do
    seats = String.to_integer(seats)

    socket =
      assign(socket,
        seats: seats,
        amount: LicenseCalculator.calc(seats)
      )

    {:noreply, socket}
  end
end
