defmodule CrmWeb.ContractLive.Show do
  use CrmWeb, :live_view

  alias Crm.Contracts
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
     |> assign(:contract, Contracts.get_contract!(id))
     |> assign(:companies, Companies.list_companies())}
  end

  defp page_title(:show), do: "Show Contract"
  defp page_title(:edit), do: "Edit Contract"
end
