defmodule GhibliLive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GhibliLiveWeb.Telemetry,
      GhibliLive.Repo,
      {DNSCluster, query: Application.get_env(:ghibli_live, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GhibliLive.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GhibliLive.Finch},
      # Start a worker by calling: GhibliLive.Worker.start_link(arg)
      # {GhibliLive.Worker, arg},
      # Start to serve requests, typically the last entry
      GhibliLiveWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GhibliLive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GhibliLiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
