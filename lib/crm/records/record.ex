defmodule Crm.Records.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :svcno, :string
    field :svcdate, :date
    field :timeused, :integer
    belongs_to :device, Crm.Devices.Device
    belongs_to :contact, Crm.Contacts.Contact
    belongs_to :createdby, Crm.Accounts.User
    belongs_to :engineer, Crm.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:svcno, :svcdate, :timeused, :device_id, :contact_id, :createdby_id, :engineer_id])
    |> validate_required([:svcno, :svcdate, :timeused, :device_id, :contact_id, :createdby_id, :engineer_id])
  end
end
