defmodule Crm.RecordsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crm.Records` context.
  """

  @doc """
  Generate a record.
  """
  def record_fixture(attrs \\ %{}) do
    {:ok, record} =
      attrs
      |> Enum.into(%{
        svcdate: ~D[2024-06-04],
        svcno: "some svcno",
        timeused: 42
      })
      |> Crm.Records.create_record()

    record
  end
end
