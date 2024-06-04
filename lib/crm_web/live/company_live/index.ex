defmodule CrmWeb.CompanyLive.Index do
  use CrmWeb, :live_view

  alias Crm.Companies
  alias Crm.Companies.Company
  alias Crm.Countries

  @impl true
  def mount(params, _session, socket) do
    companies = Companies.paginate_companies(params).entries
    total_pages = Companies.paginate_companies(params).total_pages
    page_number = Companies.paginate_companies(params).page_number
    total_entries = Companies.paginate_companies(params).total_entries

    {:ok, stream(socket
    |> assign(:contacts, companies)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :companies,
    companies)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Company")
    |> assign(:company, Companies.get_company!(id))
    |> assign(:countries, Countries.list_countries())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Company")
    |> assign(:company, %Company{})
    |> assign(:countries, Countries.list_countries())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Companies")
    |> assign(:company, nil)
  end

  @impl true
  def handle_info({CrmWeb.CompanyLive.FormComponent, {:saved, company}}, socket) do
    {:noreply, stream_insert(socket, :companies, company)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    company = Companies.get_company!(id)
    {:ok, _} = Companies.delete_company(company)

    {:noreply, stream_delete(socket, :companies, company)}
  end
end
