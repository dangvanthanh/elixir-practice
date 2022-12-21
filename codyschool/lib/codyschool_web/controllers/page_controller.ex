defmodule CodyschoolWeb.PageController do
  use CodyschoolWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
