defmodule Crm.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    field :billingadd1, :string
    field :billingadd2, :string
    field :postalcode, :string
    belongs_to :country, Crm.Countries.Country

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :billingadd1, :billingadd2, :postalcode, :country_id])
    |> validate_required([:name, :billingadd1, :billingadd2, :postalcode, :country_id])
  end
end
