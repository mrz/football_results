defmodule FootballResultsWeb.MatchView do
  use FootballResultsWeb, :view
  alias FootballResultsWeb.MatchView

  def render("index.json", %{matches: matches}) do
    %{data: render_many(matches, MatchView, "match.json")}
  end

  def render("show.json", %{match: match}) do
    %{data: render_one(match, MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    %{id: match.id,
      division: match.division,
      season: match.season,
      hteam: match.hteam,
      ateam: match.ateam,
      fthg: match.fthg,
      ftag: match.ftag,
      ftr: match.ftr,
      hthg: match.hthg,
      htag: match.htag,
      htr: match.htr}
  end
end
