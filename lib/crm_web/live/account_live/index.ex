
defmodule CrmWeb.AccountLive.Index do
  use CrmWeb, :live_view
  alias Crm.Accounts

  @impl true
  def mount(_params, _sessions, socket) do
    {:ok, stream(socket, :accounts, Accounts.list_accounts)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:comment, nil)
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Profile")
    |> assign(:account, Accounts.get_user!(id))
  end

  defp apply_action(socket, :edit_pwd, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Password")
    |> assign(:account, Accounts.get_user!(id))
  end

end
