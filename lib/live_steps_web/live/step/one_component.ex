defmodule LiveStepsWeb.StepLive.OneComponent do
  use Phoenix.LiveComponent

  def update(%{id: step}, socket) do
    {:ok, assign(socket, :step, step)}
  end

  def handle_event("next", _params, socket) do
    send(self(), {:step, :two})

    {:noreply, socket}
  end
end
