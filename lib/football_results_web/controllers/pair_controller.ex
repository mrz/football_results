defmodule FootballResultsWeb.PairController do
  use FootballResultsWeb, :controller

  alias FootballResults.Data

  def index(conn, _params) do
    pairs = Data.list_pairs()

    case get_req_header(conn, "content-type") do
      ["application/json"] ->
        render(conn, "index.json", pairs: pairs)

      ["application/octet-stream"] ->
        data = Data.serialize_pairs_to_protobuf(pairs)
        Plug.Conn.send_resp(conn, 200, data)
    end
  end
end
