defmodule FootballResultsWeb.Router do
  use FootballResultsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FootballResultsWeb do
    pipe_through :api

    get "/pairs", PairController, :index

    get "/matches", MatchController, :index
    get "/matches/:division/:season", MatchController, :index
  end
end
