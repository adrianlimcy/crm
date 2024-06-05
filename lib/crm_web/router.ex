defmodule CrmWeb.Router do
  use CrmWeb, :router

  import CrmWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CrmWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CrmWeb do
    pipe_through :browser

    get "/", PageController, :home


  end

  # Other scopes may use custom stacks.
  # scope "/api", CrmWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:crm, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CrmWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", CrmWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{CrmWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", CrmWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{CrmWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email

      live "/countries", CountryLive.Index, :index
      live "/countries/new", CountryLive.Index, :new
      live "/countries/:id/edit", CountryLive.Index, :edit

      live "/countries/:id", CountryLive.Show, :show
      live "/countries/:id/show/edit", CountryLive.Show, :edit

      live "/companies", CompanyLive.Index, :index
      live "/companies/new", CompanyLive.Index, :new
      live "/companies/:id/edit", CompanyLive.Index, :edit

      live "/companies/:id", CompanyLive.Show, :show
      live "/companies/:id/show/edit", CompanyLive.Show, :edit

      live "/contacts", ContactLive.Index, :index
      live "/contacts/new", ContactLive.Index, :new
      live "/contacts/:id/edit", ContactLive.Index, :edit

      live "/contacts/:id", ContactLive.Show, :show
      live "/contacts/:id/show/edit", ContactLive.Show, :edit

      live "/contracts", ContractLive.Index, :index
      live "/contracts/new", ContractLive.Index, :new
      live "/contracts/:id/edit", ContractLive.Index, :edit

      live "/contracts/:id", ContractLive.Show, :show
      live "/contracts/:id/show/edit", ContractLive.Show, :edit

      live "/devices", DeviceLive.Index, :index
      live "/devices/new", DeviceLive.Index, :new
      live "/devices/:id/edit", DeviceLive.Index, :edit

      live "/devices/:id", DeviceLive.Show, :show
      live "/devices/:id/show/edit", DeviceLive.Show, :edit

      live "/records", RecordLive.Index, :index
      live "/records/new", RecordLive.Index, :new
      live "/records/:id/edit", RecordLive.Index, :edit

      live "/records/:id", RecordLive.Show, :show
      live "/records/:id/show/edit", RecordLive.Show, :edit
    end
  end

  scope "/", CrmWeb do
    pipe_through [:browser, :require_admin]

    live_session :require_admin,
      on_mount: [{CrmWeb.UserAuth, :ensure_authenticated}] do

      live "/accounts",  AccountLive.Index, :index
      live "/accounts/:id/edit", AccountLive.Index, :edit
      live "/accounts/:id/edit_pwd", AccountLive.Index, :edit_pwd
    end
  end


  scope "/", CrmWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{CrmWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
