defmodule FootballResultsWeb.PairController do
  use FootballResultsWeb, :controller

  alias FootballResults.Data

  def index(conn, _params) do
    pairs = Data.list_pairs()
    render(conn, "index.json", pairs: pairs)
  end
end
