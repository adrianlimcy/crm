defmodule CrmWeb.ContactLive.Show do
  alias Crm.Companies
  use CrmWeb, :live_view

  alias Crm.Contacts
  alias Crm.Companies

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:contact, Contacts.get_contact!(id))
     |> assign(:companies, Companies.list_companies())
    }
  end

  defp page_title(:show), do: "Show Contact"
  defp page_title(:edit), do: "Edit Contact"
end
