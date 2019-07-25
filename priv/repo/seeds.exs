# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FootballResults.Repo.insert!(%FootballResults.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FootballResults.Data.Match
alias FootballResults.Repo

defmodule FootballResults.Seeds do
  def convert_and_store({:ok, row}) do
    convert(row)
    |> store
  end

  defp store(data) do
    changeset = Match.changeset(%Match{}, data)
    Repo.insert!(changeset)
  end

  defp convert(row) do
    Map.drop(row, [:id]) # drop id key, not needed
    |> Map.update!(:date, &convert_date/1)
    |> Map.update!(:fthg, &String.to_integer/1)
    |> Map.update!(:ftag, &String.to_integer/1)
    |> Map.update!(:hthg, &String.to_integer/1)
    |> Map.update!(:htag, &String.to_integer/1)
  end

  defp convert_date(date) do
    Timex.parse(date, "{D}/{M}/{YYYY}")
    |> case do
      {:ok, val} -> Timex.to_date(val)
      _ -> nil
    end
  end
end

File.stream!("./Data.csv")
|> Stream.drop(1) # drop header line
|> CSV.decode(
  headers: [
    :id,
    :division,
    :season,
    :date,
    :hteam,
    :ateam,
    :fthg,
    :ftag,
    :ftr,
    :hthg,
    :htag,
    :htr
  ]
)
|> Enum.each(&FootballResults.Seeds.convert_and_store/1)
