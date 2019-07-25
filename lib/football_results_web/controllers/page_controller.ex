defmodule FootballResultsWeb.PageController do
  use FootballResultsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
