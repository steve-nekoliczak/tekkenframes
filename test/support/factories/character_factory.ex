defmodule Tekkenframes.CharacterFactory do
  @moduledoc """
  Factory for the character model.
  """

  use ExMachina.Ecto, repo: Tekkenframes.Repo

  defmacro __using__(_opts) do
    quote do
      def character_factory do
        %Tekkenframes.Character{
          name: "Heihachi",
        }
      end
    end
  end
end
