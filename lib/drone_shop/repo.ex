defmodule DroneShop.Repo do
  use Ecto.Repo,
    otp_app: :drone_shop,
    adapter: Ecto.Adapters.Postgres
end
