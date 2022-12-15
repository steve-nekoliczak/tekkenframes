defmodule TekkenframesWeb.CharacterController do
  use TekkenframesWeb, :controller
  import CSV

  def index(conn, params) do
    output = %{game: params["game"], character: params["character"]}
    json(conn, output)
  end

  def import_csv(conn, params) do
    output = get_values(params["file"].path)
    # IO.inspect(conn, label: "conn")
    # json(conn, params["file"].path)
    json(conn, "sup")
  end

  def get_values(path) do
    # TODO move to model, add moves to database, return errors
    Path.expand(path)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(fn move ->
      {:ok, fields} = move
      IO.inspect(move, label: "move")
      # |> Repo.insert
    end)
  end
end
