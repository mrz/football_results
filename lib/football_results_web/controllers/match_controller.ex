defmodule FootballResultsWeb.MatchController do
  use FootballResultsWeb, :controller

  alias FootballResults.Data
  alias FootballResults.Data.Match

  action_fallback FootballResultsWeb.FallbackController

  def index(conn, %{"division" => division, "season" => season}) do
    matches = Data.list_matches_by_divison_and_season(division, season)
    render(conn, "index.json", matches: matches)
  end

  def index(conn, params) do
    matches = Data.list_matches()
    render(conn, "index.json", matches: matches)
  end

  def show(conn, %{"id" => id}) do
    match = Data.get_match!(id)
    render(conn, "show.json", match: match)
  end
end
