defmodule DwaOutdoorWeb.TaskLive do
  use DwaOutdoorWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket = assign(socket, test: 10) #set default of state-variables
    {:ok, socket} #always return tuple
  end

end
