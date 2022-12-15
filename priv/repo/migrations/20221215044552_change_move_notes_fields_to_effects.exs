defmodule Tekkenframes.Repo.Migrations.ChangeMoveNotesFieldsToEffects do
  use Ecto.Migration

  def change do
    rename table("moves"), :on_block_notes, to: :on_block_effects
    rename table("moves"), :on_counter_hit_notes, to: :on_counter_hit_effects
    rename table("moves"), :on_hit_notes, to: :on_hit_effects
    rename table("moves"), :start_up_notes, to: :start_up_effects
  end
end
