defmodule Crm.RecordsTest do
  use Crm.DataCase

  alias Crm.Records

  describe "records" do
    alias Crm.Records.Record

    import Crm.RecordsFixtures

    @invalid_attrs %{svcno: nil, svcdate: nil, timeused: nil}

    test "list_records/0 returns all records" do
      record = record_fixture()
      assert Records.list_records() == [record]
    end

    test "get_record!/1 returns the record with given id" do
      record = record_fixture()
      assert Records.get_record!(record.id) == record
    end

    test "create_record/1 with valid data creates a record" do
      valid_attrs = %{svcno: "some svcno", svcdate: ~D[2024-06-04], timeused: 42}

      assert {:ok, %Record{} = record} = Records.create_record(valid_attrs)
      assert record.svcno == "some svcno"
      assert record.svcdate == ~D[2024-06-04]
      assert record.timeused == 42
    end

    test "create_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_record(@invalid_attrs)
    end

    test "update_record/2 with valid data updates the record" do
      record = record_fixture()
      update_attrs = %{svcno: "some updated svcno", svcdate: ~D[2024-06-05], timeused: 43}

      assert {:ok, %Record{} = record} = Records.update_record(record, update_attrs)
      assert record.svcno == "some updated svcno"
      assert record.svcdate == ~D[2024-06-05]
      assert record.timeused == 43
    end

    test "update_record/2 with invalid data returns error changeset" do
      record = record_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_record(record, @invalid_attrs)
      assert record == Records.get_record!(record.id)
    end

    test "delete_record/1 deletes the record" do
      record = record_fixture()
      assert {:ok, %Record{}} = Records.delete_record(record)
      assert_raise Ecto.NoResultsError, fn -> Records.get_record!(record.id) end
    end

    test "change_record/1 returns a record changeset" do
      record = record_fixture()
      assert %Ecto.Changeset{} = Records.change_record(record)
    end
  end
end
