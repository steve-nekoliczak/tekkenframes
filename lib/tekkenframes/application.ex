defmodule Tekkenframes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tekkenframes.Repo,
      # Start the Telemetry supervisor
      TekkenframesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tekkenframes.PubSub},
      # Start the Endpoint (http/https)
      TekkenframesWeb.Endpoint
      # Start a worker by calling: Tekkenframes.Worker.start_link(arg)
      # {Tekkenframes.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tekkenframes.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TekkenframesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
