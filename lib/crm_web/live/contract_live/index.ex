defmodule CrmWeb.ContractLive.Index do
  use CrmWeb, :live_view

  alias Crm.Contracts
  alias Crm.Contracts.Contract
  alias Crm.Companies

  @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, stream(socket, :contracts, Contracts.list_contracts())}
  # end

  def mount(params, _session, socket) do
    # contracts = Contracts.paginate_contracts(params).entries
    contracts = Contracts.sorted_contracts(params)
    total_pages = Contracts.paginate_contracts(params).total_pages
    page_number = Contracts.paginate_contracts(params).page_number
    total_entries = Contracts.paginate_contracts(params).total_entries

    {:ok, stream(socket
    |> assign(:contracts, contracts)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :contracts,
    contracts)}
  end


  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Contract")
    |> assign(:contract, Contracts.get_contract!(id))
    |> assign(:companies, Companies.list_companies())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Contract")
    |> assign(:contract, %Contract{})
    |> assign(:companies, Companies.list_companies())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Contracts")
    |> assign(:contract, nil)
  end

  @impl true
  def handle_info({CrmWeb.ContractLive.FormComponent, {:saved, contract}}, socket) do
    {:noreply, stream_insert(socket, :contracts, contract)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    contract = Contracts.get_contract!(id)
    {:ok, _} = Contracts.delete_contract(contract)

    {:noreply, stream_delete(socket, :contracts, contract)}
  end
end
