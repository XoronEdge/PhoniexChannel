defmodule RealtimeappWeb.VideoChannel do
  use RealtimeappWeb, :channel

  def join("video:" <> _video_id, params, socket) do
    # :timer.send_interval(5_000, :ping)
    # :timer.send_interval(1_000, :pong)
    # topic is in socket by default
    IO.inspect(params)
    {:ok, assign(socket, :username, params["name"])}
  end

  def handle_info(:ping, socket) do
    count = socket.assigns[:count] || 1
    username = socket.assigns[:username] || nil
    push(socket, "ping", %{count: count + 1, username: username})
    {:noreply, assign(socket, :count, count + 1)}
  end

  def handle_info(:pong, socket) do
    count = socket.assigns[:count] || 1
    username = socket.assigns[:topiusernamec] || nil
    push(socket, "pong", %{count: count + 1, username: username})
    {:noreply, assign(socket, :count, count + 1)}
  end

  def handle_in("new_message", payload, socket) do
    broadcast(socket, "new_message", %{
      user: %{username: socket.assigns[:username], message: payload["message"]}
    })

    {:reply, :ok, socket}
  end
end
