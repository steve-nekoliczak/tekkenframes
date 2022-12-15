defmodule Tekkenframes.Factory do
  @moduledoc """
  Factory containing all factories for tekkenframes.
  """

  use ExMachina.Ecto, repo: Tekkenframes.Repo
  use Tekkenframes.CharacterFactory
  use Tekkenframes.MoveFactory
end
