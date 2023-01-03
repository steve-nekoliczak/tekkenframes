defmodule TekkenframesWeb.CharacterController do
  use TekkenframesWeb, :controller
  alias Tekkenframes.{Repo, Character}
  import CSV

  def index(conn, params) do
    output = %{game: params["game"], character: params["character"]}
    json(conn, output)
  end

  def import_csv(conn, params) do
    output = insert_moves_from_csv(params["file"].path, params["character_name"])
    # IO.inspect(conn, label: "conn")
    # TODO return http code and body with errors
    json(conn, "sup")
  end

  def insert_moves_from_csv(csv_path, character_name) do
    Path.expand(csv_path)
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(fn row ->
      {:ok, move} = row
      Repo.get_by(Character, name: character_name)
        |> Character.add_move(move)
    end)
  end
end
