defmodule Tekkenframes.Factory do
  use ExMachina.Ecto, repo: Tekkenframes.Repo
  use Tekkenframes.CharacterFactory
  use Tekkenframes.MoveFactory
end
