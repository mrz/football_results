defmodule FootballResultsWeb.SeasonController do
  use FootballResultsWeb, :controller

  alias FootballResults.Data

  def index(conn, _params) do
    seasons = Data.list_seasons()

    case get_req_header(conn, "content-type") do
      ["application/json"] ->
        render(conn, "index.json", seasons: seasons)

      ["application/octet-stream"] ->
        data = Data.serialize_seasons_to_protobuf(seasons)
        Plug.Conn.send_resp(conn, 200, data)
    end
  end
end
