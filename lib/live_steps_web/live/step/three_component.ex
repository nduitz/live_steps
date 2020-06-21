defmodule LiveStepsWeb.StepLive.ThreeComponent do
  use Phoenix.LiveComponent

  def update(%{id: step}, socket) do
    {:ok, assign(socket, :step, step)}
  end

  def handle_event("next", _params, socket) do
    send(self(), {:step, :four})

    {:noreply, socket}
  end
end
