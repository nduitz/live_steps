defmodule LiveStepsWeb.StepLive.FourComponent do
  use Phoenix.LiveComponent

  def update(%{id: step}, socket) do
    {:ok, assign(socket, :step, step)}
  end

  def handle_event("next", _params, socket) do
    send(self(), {:step, :one})

    {:noreply, socket}
  end
end
