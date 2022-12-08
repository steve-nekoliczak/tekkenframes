defmodule Tekkenframes.MoveFactory do
  @moduledoc """
  Factory for the move model.
  """
  use ExMachina.Ecto, repo: Tekkenframes.Repo

  defmacro __using__(_opts) do
    quote do
      def move_factory do
        %Tekkenframes.Move{
          character: build(:character),
          damage: "10",
          hit_level: "h",
          input: "1",
          on_block_frame: "+1",
          on_counter_hit_frame: "-1",
          on_hit_frame: "+2",
          start_up_frame: "10",
          version: "5.00"
        }
      end
    end
  end
end
