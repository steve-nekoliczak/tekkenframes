defmodule Tekkenframes.Move do
  @moduledoc """
  Model for characters' moves.
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Tekkenframes.RegexHelper, as: Regex

  schema "moves" do
    belongs_to :character, Tekkenframes.Character
    field :input, :string
    field :hit_level, :string
    field :damage, :string
    field :start_up_frames, :string
    field :start_up_effects, :string
    field :on_block_frames, :string
    field :on_block_effects, :string
    field :on_hit_frames, :string
    field :on_hit_effects, :string
    field :on_counter_hit_frames, :string
    field :on_counter_hit_effects, :string
    field :notes, :string
    field :version, :string

    timestamps()
  end

  @doc false
  def changeset(move, attrs) do
    move
    |> cast(attrs, cast_fields())
    |> validate_required(validate_required_fields())
    |> validate_format(:input, Regex.input_regex())
    |> validate_format(:hit_level, Regex.hit_level_regex())
    |> validate_format(:damage, Regex.damage_regex())
    |> validate_format(:start_up_frames, Regex.start_up_regex())
    |> validate_format(:on_block_frames, Regex.frames_regex())
    |> validate_format(:on_hit_frames, Regex.frames_regex())
    |> validate_format(:on_counter_hit_frames, Regex.frames_regex())
  end

  def cast_fields do
    [
      :character_id,
      :input,
      :hit_level,
      :damage,
      :start_up_frames,
      :start_up_effects,
      :on_block_frames,
      :on_block_effects,
      :on_hit_frames,
      :on_hit_effects,
      :on_counter_hit_frames,
      :on_counter_hit_effects,
      :notes,
      :version
    ]
  end

  def validate_required_fields do
    [
      :character_id,
      :input,
      :hit_level,
      :damage,
      :start_up_frames,
      :on_block_frames,
      :on_hit_frames,
      :on_counter_hit_frames,
      :version
    ]
  end
end
