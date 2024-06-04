defmodule Crm.Repo.Migrations.AddNameProfileRole do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :string
      add :profile, :string
      add :role, :string
      add :active, :boolean
    end

  end
end
