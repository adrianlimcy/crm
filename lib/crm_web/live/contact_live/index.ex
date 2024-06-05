defmodule CrmWeb.ContactLive.Index do
  use CrmWeb, :live_view

  alias Crm.Contacts
  alias Crm.Contacts.Contact
  alias Crm.Companies

  @impl true
  def mount(params, _session, socket) do
    # contacts = Contacts.paginate_contacts(params).entries
    contacts = Contacts.sorted_contacts(params)
    total_pages = Contacts.paginate_contacts(params).total_pages
    page_number = Contacts.paginate_contacts(params).page_number
    total_entries = Contacts.paginate_contacts(params).total_entries

    {:ok, stream(socket
    |> assign(:contacts, contacts)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :contacts,
    contacts)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Contact")
    |> assign(:contact, Contacts.get_contact!(id))
    |> assign(:companies, Companies.list_companies())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Contact")
    |> assign(:contact, %Contact{})
    |> assign(:companies, Companies.list_companies())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Contacts")
    |> assign(:contact, nil)
  end

  @impl true
  def handle_info({CrmWeb.ContactLive.FormComponent, {:saved, contact}}, socket) do
    {:noreply, stream_insert(socket, :contacts, contact)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    contact = Contacts.get_contact!(id)
    {:ok, _} = Contacts.delete_contact(contact)

    {:noreply, stream_delete(socket, :contacts, contact)}
  end
end
