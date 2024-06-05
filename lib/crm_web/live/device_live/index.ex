defmodule CrmWeb.DeviceLive.Index do
  use CrmWeb, :live_view

  alias Crm.Devices
  alias Crm.Devices.Device
  alias Crm.Contracts

  @impl true
  def mount(params, _session, socket) do
    devices = Devices.paginate_devices(params).entries
    total_pages = Devices.paginate_devices(params).total_pages
    page_number = Devices.paginate_devices(params).page_number
    total_entries = Devices.paginate_devices(params).total_entries

    {:ok, stream(socket
    |> assign(:devices, devices)
    |> assign(:total_pages, total_pages)
    |> assign(:page_number, page_number)
    |> assign(:total_entries, total_entries),
    :devices,
    devices)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Device")
    |> assign(:device, Devices.get_device!(id))
    |> assign(:contracts, Contracts.list_contracts())
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Device")
    |> assign(:device, %Device{})
    |> assign(:contracts, Contracts.list_contracts())
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Devices")
    |> assign(:device, nil)
  end

  @impl true
  def handle_info({CrmWeb.DeviceLive.FormComponent, {:saved, device}}, socket) do
    {:noreply, stream_insert(socket, :devices, device)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    device = Devices.get_device!(id)
    {:ok, _} = Devices.delete_device(device)

    {:noreply, stream_delete(socket, :devices, device)}
  end
end
