defmodule FootballResults.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add :division, :string
      add :season, :integer
      add :hteam, :string
      add :ateam, :string
      add :fthg, :integer
      add :ftag, :integer
      add :ftr, :string
      add :hthg, :integer
      add :htag, :integer
      add :htr, :string
      add :date, :date

      timestamps()
    end

  end
end
