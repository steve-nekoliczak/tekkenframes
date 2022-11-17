defmodule Tekkenframes.Repo.Migrations.AddFields do
  use Ecto.Migration

  def change do
    alter table(:characters) do
      add :inserted_at, :timestamp, default: fragment("NOW()")
      add :updated_at, :timestamp, default: fragment("NOW()")
    end

    alter table(:moves) do
      add :version, :string
    end
  end
end
