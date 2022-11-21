defmodule Tekkenframes.Move do
  use Ecto.Schema
  import Ecto.Changeset
  import Tekkenframes.RegexHelper, only: [input_regex: 0, damage_regex: 0, hit_level_regex: 0, frame_regex: 0, start_up_regex: 0]

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
    field :version, :string

    timestamps()
  end

  @doc false
  def changeset(move, attrs) do
    move
    |> cast(attrs, [:character_id, :input, :hit_level, :damage, :start_up_frame, :on_block_frame, :on_hit_frame, :on_counter_hit_frame, :notes, :version])
    |> validate_required([:character_id, :input, :hit_level, :damage, :start_up_frame, :on_block_frame, :on_hit_frame, :on_counter_hit_frame, :version])
    |> validate_format(:input, input_regex)
    |> validate_format(:damage, damage_regex)
    |> validate_format(:hit_level, hit_level_regex)
    |> validate_format(:on_block_frame, frame_regex)
    |> validate_format(:on_counter_hit_frame, frame_regex)
    |> validate_format(:on_hit_frame, frame_regex)
    |> validate_format(:start_up_frame, start_up_regex)
  end

end