defmodule Tekkenframes.Repo do
  use Ecto.Repo,
    otp_app: :tekkenframes,
    adapter: Ecto.Adapters.Postgres
end
