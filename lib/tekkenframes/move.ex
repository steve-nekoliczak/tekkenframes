defmodule Tekkenframes.Move do
  use Ecto.Schema
  import Ecto.Changeset

  schema "moves" do
    belongs_to :character, Tekkenframes.Character
    field :damage, :string
    field :hit_level, :string
    field :input, :string
    field :notes, :string
    field :on_block_frame, :string
    field :on_counter_hit_frame, :string
    field :on_hit_frame, :string
    field :start_up_frame, :string

    timestamps()
  end

  @doc false
  def changeset(move, attrs) do
    move
    |> cast(attrs, [:input, :hit_level, :damage, :start_up_frame, :on_block_frame, :on_hit_frame, :on_counter_hit_frame, :notes])
    |> validate_required([:input, :hit_level, :damage, :start_up_frame, :on_block_frame, :on_hit_frame, :on_counter_hit_frame])
    # TODO add regex validations per field here
  end

end
