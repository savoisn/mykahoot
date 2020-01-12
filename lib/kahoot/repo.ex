defmodule Kahoot.Repo do
  use Ecto.Repo,
    otp_app: :kahoot,
    adapter: Ecto.Adapters.Postgres
end
