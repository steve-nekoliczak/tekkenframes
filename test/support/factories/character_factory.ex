defmodule Tekkenframes.CharacterFactory do
  @moduledoc """
  Factory for the character model.
  """

  use ExMachina.Ecto, repo: Tekkenframes.Repo

  defmacro __using__(_opts) do
    quote do
      @names ~W<Heihachi Kazuya Jin>

      def character_factory do
        %Tekkenframes.Character{
          name: Enum.random(@names),
        }
      end
    end
  end
end
