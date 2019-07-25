defmodule FootballResultsWeb.Router do
  use FootballResultsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FootballResultsWeb do
    pipe_through :api

    resources "/matches", MatchController, only: [:index, :show]
  end
end
