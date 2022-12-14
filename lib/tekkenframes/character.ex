defmodule Tekkenframes.Character do
  @moduledoc """
  Model for a Tekken character.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    has_many :moves, Tekkenframes.Move

    timestamps()
  end

  @doc false
  def changeset(move, attrs) do
    move
    |> cast(attrs, ~W<name>a)
    |> validate_required(~W<name>a)
  end
end
