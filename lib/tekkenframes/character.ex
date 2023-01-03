defmodule Tekkenframes.Character do
  @moduledoc """
  Model for a Tekken character.
  """

  use Ecto.Schema
  alias Tekkenframes.{Repo, Move}
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    has_many :moves, Move

    timestamps()
  end

  @doc false
  def changeset(character, attrs) do
    character
    |> cast(attrs, ~W<name>a)
    |> validate_required(~W<name>a)
  end

  def add_move(character, move) do
    %Move{character_id: character.id}
      |> Move.changeset(move)
      |> Repo.insert(
        on_conflict: {:replace_all_except, [:id, :character_id, :input]},
        conflict_target: [:character_id, :input]
      )
  end
end
