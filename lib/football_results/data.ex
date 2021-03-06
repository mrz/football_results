defmodule FootballResults.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias FootballResults.Repo

  alias FootballResults.Data.Match
  alias FootballResults.Data.Protobuf

  @doc """
  return a list of seasons.

  A season is the tuple (division, season), and the list is read from the database
  with a SELECT DISTINCT clause.
  """
  def list_seasons do
    query =
      from m in Match,
        distinct: [m.division, m.season],
        select: %{:division => m.division, :season => m.season}

    Repo.all(query)
  end

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches do
    Repo.all(Match)
  end

  @doc """
  Returns all the matches for the given division and season
  """
  def list_matches_by_divison_and_season(division, season) do
    query = from m in Match, where: m.division == ^division and m.season == ^season
    Repo.all(query)
  end

  @doc """
  Gets a single match.

  Raises `Ecto.NoResultsError` if the Match does not exist.

  ## Examples

      iex> get_match!(123)
      %Match{}

      iex> get_match!(456)
      ** (Ecto.NoResultsError)

  """
  def get_match!(id), do: Repo.get!(Match, id)

  @doc """
  Creates a match.

  ## Examples

      iex> create_match(%{field: value})
      {:ok, %Match{}}

      iex> create_match(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_match(attrs \\ %{}) do
    %Match{}
    |> Match.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a match.

  ## Examples

      iex> update_match(match, %{field: new_value})
      {:ok, %Match{}}

      iex> update_match(match, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_match(%Match{} = match, attrs) do
    match
    |> Match.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Match.

  ## Examples

      iex> delete_match(match)
      {:ok, %Match{}}

      iex> delete_match(match)
      {:error, %Ecto.Changeset{}}

  """
  def delete_match(%Match{} = match) do
    Repo.delete(match)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking match changes.

  ## Examples

      iex> change_match(match)
      %Ecto.Changeset{source: %Match{}}

  """
  def change_match(%Match{} = match) do
    Match.changeset(match, %{})
  end

  def serialize_matches_to_protobuf(matches) do
    Enum.map(matches, &serialize_match_to_protobuf/1)
  end

  def serialize_match_to_protobuf(match) do
    {:ok, date} = Timex.format(match.date, "{D}/{M}/{YYYY}")

    Protobuf.Match.new(
      id: match.id,
      division: match.division,
      season: match.season,
      hteam: match.hteam,
      ateam: match.ateam,
      fthg: match.fthg,
      ftag: match.ftag,
      ftr: match.ftr,
      hthg: match.hthg,
      htag: match.htag,
      htr: match.htr,
      date: date
    )
    |> Protobuf.Match.encode()
  end

  def serialize_seasons_to_protobuf(seasons) do
    Enum.map(seasons, &serialize_season_to_protobuf/1)
  end

  def serialize_season_to_protobuf(season) do
    Protobuf.Season.new(
      division: season.division,
      season: season.season
    )
    |> Protobuf.Season.encode()
  end
end
