defmodule FootballResults.Instrumentation do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    :ok =
      :telemetry.attach(
        "log_request_start_handler",
        [:phoenix, :endpoint, :start],
        &FootballResults.Telemetry.log_request_start/4,
        nil
      )

    :ok =
      :telemetry.attach(
        "log_request_end_handler",
        [:phoenix, :endpoint, :stop],
        &FootballResults.Telemetry.log_request_end/4,
        nil
      )

    :ok =
      :telemetry.attach(
        "log_queries_handler",
        [:football_results, :repo, :query],
        &FootballResults.Telemetry.log_queries/4,
        nil
      )

    {:ok, state}
  end
end
