defmodule FootballResults.Repo do
  use Ecto.Repo,
    otp_app: :football_results,
    adapter: Ecto.Adapters.Postgres

  def init(_type, config) do

    dbhost = case System.get_env("PGHOST") do
      nil -> "localhost"
      host -> host
    end

    {:ok, Keyword.put(config, :hostname, dbhost)}
  end
end
