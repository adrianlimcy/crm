defmodule CrmWeb.CountryLive.Index do
  use CrmWeb, :live_view

  alias Crm.Countries
  alias Crm.Countries.Country

  @impl true
  def mount(params, _session, socket) do
    countries = Countries.paginate_countries(params).entries
    total_pages = Countries.paginate_countries(params).total_pages
    page_number = Countries.paginate_countries(params).page_number
    total_entries = Countries.paginate_countries(params).total_entries

    {:ok, stream(socket
    |> assign(:countries, countries)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :countries,
    countries)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Country")
    |> assign(:country, Countries.get_country!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Country")
    |> assign(:country, %Country{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Countries")
    |> assign(:country, nil)
  end

  @impl true
  def handle_info({CrmWeb.CountryLive.FormComponent, {:saved, country}}, socket) do
    {:noreply, stream_insert(socket, :countries, country)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    country = Countries.get_country!(id)
    {:ok, _} = Countries.delete_country(country)

    {:noreply, stream_delete(socket, :countries, country)}
  end
end
