defmodule Crm.Contracts.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contracts" do
    field :active, :boolean, default: false
    field :type, :string
    field :value, :decimal
    field :do, :string
    field :po, :string
    field :itq, :string
    field :startdate, :date
    field :enddate, :date
    field :svcalloperdevice, :integer
    field :timeallo, :integer
    field :remarks, :string
    belongs_to :company, Crm.Companies.Company
    belongs_to :careof, Crm.Companies.Company

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:do, :po, :itq, :startdate, :enddate, :type, :svcalloperdevice, :timeallo, :value, :active, :company_id, :careof_id, :remarks])
    |> validate_required([:po, :startdate, :enddate, :type, :active, :company_id, :remarks])
  end
end
