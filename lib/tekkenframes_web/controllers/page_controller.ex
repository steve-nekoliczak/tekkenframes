defmodule TekkenframesWeb.PageController do
  use TekkenframesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
