defmodule Crm.Countries.Country do
  alias Crm.Companies.Company
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
