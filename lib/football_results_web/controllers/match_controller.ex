defmodule FootballResultsWeb.MatchController do
  use FootballResultsWeb, :controller

  alias FootballResults.Data
  alias FootballResults.Data.Match
  alias FootballResults.Data.Protobuf

  action_fallback FootballResultsWeb.FallbackController

  def index(conn, %{"division" => division, "season" => season}) do
    matches = Data.list_matches_by_divison_and_season(division, season)

    case get_req_header(conn, "content-type") do
      ["application/json"] ->
        render(conn, "index.json", matches: matches)

      ["application/octet-stream"] ->
        data = Data.serialize_matches_to_protobuf(matches)
        Plug.Conn.send_resp(conn, 200, data)
    end
  end

  def index(conn, params) do
    matches = Data.list_matches()

    case get_req_header(conn, "content-type") do
      ["application/json"] ->
        render(conn, "index.json", matches: matches)

      ["application/octet-stream"] ->
        data = Data.serialize_matches_to_protobuf(matches)
        Plug.Conn.send_resp(conn, 200, data)
    end
  end

  def show(conn, %{"id" => id}) do
    match = Data.get_match!(id)
    render(conn, "show.json", match: match)
  end
end
