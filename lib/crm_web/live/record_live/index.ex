defmodule CrmWeb.RecordLive.Index do
  use CrmWeb, :live_view

  alias Crm.Records
  alias Crm.Records.Record
  alias Crm.Devices
  alias Crm.Contacts
  alias Crm.Accounts

  @impl true
  def mount(params, _session, socket) do
    records = Records.sorted_records(params)
    total_pages = Records.paginate_records(params).total_pages
    page_number = Records.paginate_records(params).page_number
    total_entries = Records.paginate_records(params).total_entries

    IO.inspect(records)

    {:ok, stream(socket
    |> assign(:records, records)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :records,
    records)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Record")
    |> assign(:record, Records.get_record!(id))
    |> assign(:contacts, Contacts.list_contacts())
    |> assign(:devices, Devices.list_devices() )
    |> assign(:engineers, Accounts.list_accounts())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Record")
    |> assign(:record, %Record{})
    |> assign(:contacts, Contacts.list_contacts())
    |> assign(:devices, Devices.list_devices() )
    |> assign(:engineers, Accounts.list_accounts())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Records")
    |> assign(:record, nil)
  end

  @impl true
  def handle_info({CrmWeb.RecordLive.FormComponent, {:saved, record}}, socket) do
    {:noreply, stream_insert(socket, :records, record)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    record = Records.get_record!(id)
    {:ok, _} = Records.delete_record(record)

    {:noreply, stream_delete(socket, :records, record)}
  end
end
