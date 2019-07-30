defmodule FootballResultsWeb.SeasonView do
  use FootballResultsWeb, :view
  alias FootballResultsWeb.SeasonView

  def render("index.json", %{seasons: seasons}) do
    %{data: render_many(seasons, SeasonView, "season.json")}
  end

  def render("season.json", %{season: season}) do
    %{division: season.division,
      season: season.season }
  end
end
