defmodule FootballResultsWeb.PairView do
  use FootballResultsWeb, :view
  alias FootballResultsWeb.PairView

  def render("index.json", %{pairs: pairs}) do
    %{data: render_many(pairs, PairView, "pair.json")}
  end

  def render("pair.json", %{pair: pair}) do
    %{division: pair.division,
      season: pair.season }
  end
end
