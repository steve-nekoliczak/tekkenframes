defmodule Tekkenframes.MoveFactory do
  @moduledoc """
  Factory for the move model.
  """

  use ExMachina.Ecto, repo: Tekkenframes.Repo

  defmacro __using__(_opts) do
    quote do
      @hit_levels ~W<h m l>
      @frames_range ~W<-100 -20 -15 -10 -5 0 5 10 15 20 100>

      def move_factory do
        %Tekkenframes.Move{
          character: build(:character),
          input: "#{Enum.random(1..4)}",
          hit_level: Enum.random(@hit_levels),
          damage: "#{Enum.random(1..30)}",
          start_up_frames: "#{Enum.random(1..200)}",
          on_block_frames: Enum.random(@frames_range),
          on_hit_frames: Enum.random(@frames_range),
          on_counter_hit_frames: Enum.random(@frames_range),
          version: "5.00"
        }
      end
    end
  end
end
