defmodule Realtimeapp.Repo do
  use Ecto.Repo,
    otp_app: :realtimeapp,
    adapter: Ecto.Adapters.Postgres
end
