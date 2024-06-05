defmodule CrmWeb.RecordLive.FormComponent do
  use CrmWeb, :live_component

  alias Crm.Records

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage record records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="record-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:svcno]} type="text" label="Svcno" />
        <.input field={@form[:svcdate]} type="date" label="Svcdate" />
        <.input field={@form[:timeused]} type="number" label="Timeused" />

        <.input
          field={@form[:device_id]}
          type="select" label="Serial No"
          options={Enum.map(@devices, &{&1.serialno, &1.id})}
        />

        <.input
          field={@form[:contact_id]}
          type="select" label="Contact Person"
          options={Enum.map(@contacts, &{&1.name, &1.id})}
        />

        <.input
          field={@form[:engineer_id]}
          type="select" label="Engineer"
          options={Enum.map(@engineers, &{&1.name, &1.id})}
        />

        <:actions>
          <.button phx-disable-with="Saving...">Save Record</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{record: record} = assigns, socket) do
    changeset = Records.change_record(record)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"record" => record_params}, socket) do
    changeset =
      socket.assigns.record
      |> Records.change_record(record_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"record" => record_params}, socket) do
    record_params = Map.put(record_params, "createdby_id", socket.assigns[:createdby])
    save_record(socket, socket.assigns.action, record_params)
  end

  defp save_record(socket, :edit, record_params) do
    case Records.update_record(socket.assigns.record, record_params) do
      {:ok, record} ->
        notify_parent({:saved, record})

        {:noreply,
         socket
         |> put_flash(:info, "Record updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_record(socket, :new, record_params) do
    case Records.create_record(record_params) do
      {:ok, record} ->
        notify_parent({:saved, record})

        {:noreply,
         socket
         |> put_flash(:info, "Record created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
