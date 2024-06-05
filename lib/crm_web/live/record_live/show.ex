defmodule CrmWeb.RecordLive.Show do
  use CrmWeb, :live_view

  alias Crm.Records
  alias Crm.Devices
  alias Crm.Contacts
  alias Crm.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:record, Records.get_record!(id))
     |> assign(:contacts, Contacts.list_contacts())
     |> assign(:devices, Devices.list_devices() )
     |> assign(:engineers, Accounts.list_accounts())}
  end

  defp page_title(:show), do: "Show Record"
  defp page_title(:edit), do: "Edit Record"
end
