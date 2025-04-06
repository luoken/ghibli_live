defmodule GhibliLive.Repo do
  use Ecto.Repo,
    otp_app: :ghibli_live,
    adapter: Ecto.Adapters.Postgres
end
