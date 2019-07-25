defmodule FootballResults.Data.Match do
  use Ecto.Schema
  import Ecto.Changeset

  @doc ~S"""
  Match schema.

  division = League Division
  season = Match Season
  hteam = Home Team
  ateam = Away Team
  FTHG and HG = Full Time Home Team Goals
  FTAG and AG = Full Time Away Team Goals
  FTR = Full Time Result (H=Home Win, D=Draw, A=Away Win)
  HTHG = Half Time Home Team Goals
  HTAG = Half Time Away Team Goals
  HTR = Half Time Result (H=Home Win, D=Draw, A=Away Win)
  """
  schema "matches" do
    field :ateam, :string
    field :date, :date
    field :division, :string
    field :ftag, :integer
    field :fthg, :integer
    field :ftr, :string
    field :htag, :integer
    field :hteam, :string
    field :hthg, :integer
    field :htr, :string
    field :season, :integer

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:division, :season, :hteam, :ateam, :fthg, :ftag, :ftr, :hthg, :htag, :htr, :date])
    |> validate_required([:division, :season, :hteam, :ateam, :fthg, :ftag, :ftr, :hthg, :htag, :htr, :date])
  end
end
