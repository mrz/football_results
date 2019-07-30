defmodule FootballResults.Telemetry do
  require Logger

  @moduledoc """

  Define :telemetry event handlers.

  Where applicable, if the time to execute a query or request exceeded 500 ms,
  log it as a warning, otherwise log it as a debug message.
  """

  @doc """

  Log database queries and how long it took to perform them.

  Time spent is the total measure of how long it took to wait in queue for a
  database connection, how much time was spent executing the query and how long
  it took to decode the data received from the database.

  """
  def log_queries([:football_results, :repo, :query], measurements, metadata, _config) do
    total_time = System.convert_time_unit(measurements.total_time, :native, :millisecond)

    logFn =
      if total_time > 500 do
        &Logger.warn/1
      else
        &Logger.debug/1
      end

    logFn.("Query #{inspect(metadata.query)} completed in #{total_time}ms")
  end

  @doc """
  Simply log that we received a request and for which endpath.
  """
  def log_request_start([:phoenix, :endpoint, :start], _measurements, metadata, _config) do
    Logger.debug("Received request to #{metadata[:conn].request_path}")
  end

  @doc """
  Log how long it took to answer to a request.
  """
  def log_request_end([:phoenix, :endpoint, :stop], measurements, metadata, config) do
    duration = System.convert_time_unit(measurements[:duration], :native, :millisecond)

    logFn =
      if duration > 500 do
        &Logger.warn/1
      else
        &Logger.debug/1
      end

    logFn.("Returned #{metadata[:conn].request_path} in #{duration}ms")
  end
end
