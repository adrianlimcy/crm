defmodule Crm.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :svcno, :string
      add :svcdate, :date
      add :timeused, :integer
      add :device_id, references(:devices, on_delete: :nothing)
      add :contact_id, references(:contacts, on_delete: :nothing)
      add :engineer_id, references(:users, on_delete: :nothing)
      add :createdby_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:records, [:device_id])
    create index(:records, [:contact_id])
    create index(:records, [:engineer_id])
    create index(:records, [:createdby_id])
  end
end
