defmodule CrmWeb.CompanyLive.Show do

  use CrmWeb, :live_view

  alias Crm.Companies
  alias Crm.Countries
  alias Crm.Records
  alias Crm.Contracts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:company, Companies.get_company!(id))
     |> assign(:countries, Countries.list_countries())
     |> assign(:records, Records.list_records_in_company(id))
     |> assign(:contracts, Contracts.list_contracts_in_company(id))
    }
  end

  defp page_title(:show), do: "Show Company"
  defp page_title(:edit), do: "Edit Company"
end
