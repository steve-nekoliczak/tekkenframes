defmodule Tekkenframes.CharacterFactory do
  @moduledoc """
  Factory for the character model.
  """

  use ExMachina.Ecto, repo: Tekkenframes.Repo

  defmacro __using__(_opts) do
    quote do
      def names do
        ["Heihachi", "Kazuya", "Jin"]
      end

      def character_factory do
        %Tekkenframes.Character{
          name: Enum.random(names()),
        }
      end
    end
  end
end
