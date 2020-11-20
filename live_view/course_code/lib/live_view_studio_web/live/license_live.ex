defmodule LiveViewStudioWeb.LicenseLive do
  use LiveViewStudioWeb, :live_view
  alias LiveViewStudio.LicenseCalculator
  import Number.Currency

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :tick)
    end
    
    expiration_time = Timex.shift(Timex.now(), hours: 1)

    socket = 
      assign( socket, 
              seats: 3, 
              amount: LicenseCalculator.calc(3), 
              expiration_time: expiration_time,
              time_remaining: time_remaining(expiration_time))
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

  def handle_info(:tick, socket) do
    expiration_time = socket.assigns.expiration_time
    socket = assign(socket, 
                    time_remaining: time_remaining(expiration_time))
    {:noreply, socket}
  end

  defp time_remaining(expiration_time) do
    DateTime.diff(expiration_time, Timex.now())
  end

  defp format_time(time) do
    time
    |> Timex.Duration.from_seconds()
    |> Timex.format_duration(:humanized)
  end
end
