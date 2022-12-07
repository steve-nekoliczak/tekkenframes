defmodule Tekkenframes.CharacterFactory do
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
