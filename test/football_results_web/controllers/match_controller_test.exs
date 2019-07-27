defmodule FootballResultsWeb.MatchControllerTest do
  use FootballResultsWeb.ConnCase

  alias FootballResults.Data
  alias FootballResults.Data.Match
  alias FootballResults.Data.Protobuf

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

  def fixture(:match) do
    {:ok, match} = Data.create_match(@valid_attrs)
    match
  end

  setup %{conn: conn} do
    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all matches (proto)", %{conn: conn} do
      match = fixture(:match)

      conn =
        conn
        |> put_req_header("content-type", "application/octet-stream")

      conn = get(conn, Routes.match_path(conn, :index))

      response = response(conn, 200)

      expected = Data.serialize_match_to_protobuf(match)

      assert response == expected
    end

    test "lists all matches (json)", %{conn: conn} do
      fixture(:match)

      conn =
        conn
        |> put_req_header("content-type", "application/json")
        |> get(Routes.match_path(conn, :index))

      response = json_response(conn, 200)["data"]

      expected = [
        %{
          "ateam" => "some ateam",
          "division" => "some division",
          "ftag" => 42,
          "fthg" => 42,
          "ftr" => "D",
          "htag" => 42,
          "hteam" => "some hteam",
          "hthg" => 42,
          "htr" => "D",
          "season" => 42,
          "date" => "20/8/2016"
        }
      ]

      assert response == expected
    end
  end

  defp create_match(_) do
    match = fixture(:match)
    {:ok, match: match}
  end
end
