defmodule Tekkenframes.Repo.Migrations.ChangeMoveFrameToFrames do
  use Ecto.Migration

  def change do
    rename table("moves"), :on_block_frame, to: :on_block_frames
    rename table("moves"), :on_counter_hit_frame, to: :on_counter_hit_frames
    rename table("moves"), :on_hit_frame, to: :on_hit_frames
    rename table("moves"), :start_up_frame, to: :start_up_frames
  end
end
