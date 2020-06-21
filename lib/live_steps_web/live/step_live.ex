defmodule LiveStepsWeb.StepLive do
  use LiveStepsWeb, :live_view

  @steps %{
    "one" => __MODULE__.OneComponent,
    "two" => __MODULE__.TwoComponent,
    "three" => __MODULE__.ThreeComponent,
    "four" => __MODULE__.FourComponent
  }

  def mount(_, _, socket) do
    IO.puts("mount")

    socket =
      socket
      |> assign(:step, "one")
      |> assign(:module, Map.fetch!(@steps, "one"))

    {:ok, socket}
  end

  def handle_info({:step, step}, socket) do
    {:noreply, push_patch(socket, to: Routes.live_path(socket, __MODULE__, step: step))}
  end

  def handle_params(%{"step" => step}, _, socket) do
    IO.puts("handle_params")

    module = Map.fetch!(@steps, step)

    socket =
      socket
      |> assign(:step, step)
      |> assign(:module, module)

    {:noreply, socket}
  end

  def handle_params(_, _, socket) do
    {:noreply, socket}
  end
end
