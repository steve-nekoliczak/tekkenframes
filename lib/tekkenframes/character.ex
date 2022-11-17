defmodule Tekkenframes.Character do
  use Ecto.Schema

  schema "characters" do
    field :name, :string
    has_many :moves, Tekkenframes.Move
  end
end
