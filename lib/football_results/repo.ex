defmodule FootballResults.Repo do
  use Ecto.Repo,
    otp_app: :football_results,
    adapter: Ecto.Adapters.Postgres
end
