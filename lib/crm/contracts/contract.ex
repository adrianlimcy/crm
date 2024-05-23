defmodule Crm.Contracts.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contracts" do
    field :active, :boolean, default: false
    field :type, :string
    field :value, :float
    field :do, :string
    field :po, :string
    field :itq, :string
    field :startdate, :date
    field :enddate, :date
    field :svcalloperdevice, :integer
    field :timeallo, :integer
    belongs_to :company, Crm.Companies.Company

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:do, :po, :itq, :startdate, :enddate, :type, :svcalloperdevice, :timeallo, :value, :active, :company_id])
    |> validate_required([:do, :po, :itq, :startdate, :enddate, :type, :svcalloperdevice, :timeallo, :value, :active, :company_id])
  end
end
