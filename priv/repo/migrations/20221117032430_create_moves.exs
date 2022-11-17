defmodule Tekkenframes.Repo.Migrations.CreateMoves do
  use Ecto.Migration

  def change do
    create table(:moves) do
      add :character_id, references("characters")
      add :input, :string
      add :hit_level, :string
      add :damage, :string
      add :start_up_frame, :string
      add :on_block_frame, :string
      add :on_hit_frame, :string
      add :on_counter_hit_frame, :string
      add :notes, :string, null: true

      timestamps()
    end
  end
end
