defmodule FootballResultsWeb.PairControllerTest do
  use FootballResultsWeb.ConnCase

  alias FootballResults.Data
  alias FootballResults.Data.Match

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("content-type", "application/json")

    {:ok, conn: conn}
  end


  describe "index" do
    test "lists all pairs", %{conn: conn} do
      conn = get(conn, Routes.pair_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end
end
