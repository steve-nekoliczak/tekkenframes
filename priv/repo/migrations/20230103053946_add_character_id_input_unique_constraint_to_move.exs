defmodule Tekkenframes.Repo.Migrations.AddCharacterIdInputUniqueConstraintToMove do
  use Ecto.Migration

  def change do
    create unique_index(:moves, [:character_id, :input], name: :unique_move_for_character_index)
  end
end
