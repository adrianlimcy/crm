defmodule Crm.Repo do
  use Ecto.Repo,
    otp_app: :crm,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 5
end
