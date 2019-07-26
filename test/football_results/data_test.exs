defmodule FootballResults.DataTest do
  use FootballResults.DataCase

  alias FootballResults.Data

  describe "matches" do
    alias FootballResults.Data.Match

    @valid_attrs %{
      ateam: "some ateam",
      division: "some division",
      ftag: 42,
      fthg: 42,
      ftr: "D",
      htag: 42,
      hteam: "some hteam",
      hthg: 42,
      htr: "D",
      season: 42,
      date: ~D[2016-08-20]
    }
    @update_attrs %{
      ateam: "some updated ateam",
      division: "some updated division",
      ftag: 43,
      fthg: 43,
      ftr: "L",
      htag: 43,
      hteam: "some updated hteam",
      hthg: 43,
      htr: "W",
      season: 43,
      date: ~D[2017-08-20]
    }
    @invalid_attrs %{
      ateam: nil,
      division: nil,
      ftag: nil,
      fthg: nil,
      ftr: nil,
      htag: nil,
      hteam: nil,
      hthg: nil,
      htr: nil,
      season: nil,
      date: nil
    }

    def match_fixture(attrs \\ %{}) do
      {:ok, match} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_match()

      match
    end

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert Data.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert Data.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      assert {:ok, %Match{} = match} = Data.create_match(@valid_attrs)
      assert match.ateam == "some ateam"
      assert match.division == "some division"
      assert match.ftag == 42
      assert match.fthg == 42
      assert match.ftr == "D"
      assert match.htag == 42
      assert match.hteam == "some hteam"
      assert match.hthg == 42
      assert match.htr == "D"
      assert match.season == 42
      assert match.date == ~D[2016-08-20]
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      assert {:ok, %Match{} = match} = Data.update_match(match, @update_attrs)
      assert match.ateam == "some updated ateam"
      assert match.division == "some updated division"
      assert match.ftag == 43
      assert match.fthg == 43
      assert match.ftr == "L"
      assert match.htag == 43
      assert match.hteam == "some updated hteam"
      assert match.hthg == 43
      assert match.htr == "W"
      assert match.season == 43
      assert match.date == ~D[2017-08-20]
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_match(match, @invalid_attrs)
      assert match == Data.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = Data.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> Data.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = Data.change_match(match)
    end
  end
end
