defmodule FootballResultsWeb.MatchControllerTest do
  use FootballResultsWeb.ConnCase

  alias FootballResults.Data
  alias FootballResults.Data.Match

  @create_attrs %{
    ateam: "some ateam",
    division: "some division",
    ftag: 42,
    fthg: 42,
    ftr: 42,
    htag: 42,
    hteam: "some hteam",
    hthg: 42,
    htr: 42,
    season: 42
  }
  @update_attrs %{
    ateam: "some updated ateam",
    division: "some updated division",
    ftag: 43,
    fthg: 43,
    ftr: 43,
    htag: 43,
    hteam: "some updated hteam",
    hthg: 43,
    htr: 43,
    season: 43
  }
  @invalid_attrs %{ateam: nil, division: nil, ftag: nil, fthg: nil, ftr: nil, htag: nil, hteam: nil, hthg: nil, htr: nil, season: nil}

  def fixture(:match) do
    {:ok, match} = Data.create_match(@create_attrs)
    match
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all matches", %{conn: conn} do
      conn = get(conn, Routes.match_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create match" do
    test "renders match when data is valid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.match_path(conn, :show, id))

      assert %{
               "id" => id,
               "ateam" => "some ateam",
               "division" => "some division",
               "ftag" => 42,
               "fthg" => 42,
               "ftr" => 42,
               "htag" => 42,
               "hteam" => "some hteam",
               "hthg" => 42,
               "htr" => 42,
               "season" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.match_path(conn, :create), match: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update match" do
    setup [:create_match]

    test "renders match when data is valid", %{conn: conn, match: %Match{id: id} = match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.match_path(conn, :show, id))

      assert %{
               "id" => id,
               "ateam" => "some updated ateam",
               "division" => "some updated division",
               "ftag" => 43,
               "fthg" => 43,
               "ftr" => 43,
               "htag" => 43,
               "hteam" => "some updated hteam",
               "hthg" => 43,
               "htr" => 43,
               "season" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, match: match} do
      conn = put(conn, Routes.match_path(conn, :update, match), match: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete match" do
    setup [:create_match]

    test "deletes chosen match", %{conn: conn, match: match} do
      conn = delete(conn, Routes.match_path(conn, :delete, match))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.match_path(conn, :show, match))
      end
    end
  end

  defp create_match(_) do
    match = fixture(:match)
    {:ok, match: match}
  end
end
