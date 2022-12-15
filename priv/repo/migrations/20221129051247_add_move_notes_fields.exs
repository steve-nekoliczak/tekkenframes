defmodule Tekkenframes.Repo.Migrations.AddMoveNotesFields do
  use Ecto.Migration

  def change do
    alter table(:moves) do
      add :on_block_notes, :string
      add :on_counter_hit_notes, :string
      add :on_hit_notes, :string
      add :start_up_notes, :string
    end
  end
end
