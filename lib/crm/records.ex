defmodule Crm.Records do
  @moduledoc """
  The Records context.
  """

  import Ecto.Query, warn: false
  alias Crm.Repo

  alias Crm.Records.Record
  alias Crm.Contracts.Contract
  alias Crm.Devices.Device
  alias Crm.Companies.Company

  @doc """
  Returns the list of records.

  ## Examples

      iex> list_records()
      [%Record{}, ...]

  """
  def list_records do
    Repo.all(Record) |> Repo.preload([:device, :contact, :createdby, :engineer])
  end

  def list_records_in_company(id) do

    query = from r in Record,
    join: d in Device,
    on: r.device_id == d.id,
    join: co in Contract,
    on: d.contract_id == co.id ,
    join: c in Company,
    on: co.company_id == c.id,
    where: c.id == ^id

    Repo.all(query) |> Repo.preload([:device, :engineer])
  end


  def paginate_records(params) do
    sortedRecord = from(c in Record, order_by: [desc: c.svcdate])
    Repo.paginate(sortedRecord, params)
  end

  def sorted_records(params) do
    paginate_records(params).entries |> Repo.preload([:contact, :device])
  end

  @doc """
  Gets a single record.

  Raises `Ecto.NoResultsError` if the Record does not exist.

  ## Examples

      iex> get_record!(123)
      %Record{}

      iex> get_record!(456)
      ** (Ecto.NoResultsError)

  """
  def get_record!(id), do: Repo.get!(Record, id) |> Repo.preload([:device, :contact, :createdby, :engineer])

  @doc """
  Creates a record.

  ## Examples

      iex> create_record(%{field: value})
      {:ok, %Record{}}

      iex> create_record(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_record(attrs \\ %{}) do
    %Record{}
    |> Record.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a record.

  ## Examples

      iex> update_record(record, %{field: new_value})
      {:ok, %Record{}}

      iex> update_record(record, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_record(%Record{} = record, attrs) do
    record
    |> Record.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a record.

  ## Examples

      iex> delete_record(record)
      {:ok, %Record{}}

      iex> delete_record(record)
      {:error, %Ecto.Changeset{}}

  """
  def delete_record(%Record{} = record) do
    Repo.delete(record)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking record changes.

  ## Examples

      iex> change_record(record)
      %Ecto.Changeset{data: %Record{}}

  """
  def change_record(%Record{} = record, attrs \\ %{}) do
    Record.changeset(record, attrs)
  end
end
