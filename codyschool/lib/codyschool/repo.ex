defmodule Codyschool.Repo do
  use Ecto.Repo,
    otp_app: :codyschool,
    adapter: Ecto.Adapters.Postgres
end
