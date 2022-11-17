defmodule TekkenframesWeb.CharacterController do
  use TekkenframesWeb, :controller

  def index(conn, _params) do
    output = %{game: _params["game"], character: _params["character"]}
    json(conn, output)
  end
end
