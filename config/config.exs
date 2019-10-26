# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :repo_watcher, RepoWatcherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CPyRyggKtHS5/XuNaQL6UMPdHl49y1/a3kn0yeAbGPqO4RmZ8KQUExp7k2z3GMFE",
  render_errors: [view: RepoWatcherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RepoWatcher.PubSub, adapter: Phoenix.PubSub.PG2]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Git Client Params
config :git_client,
github_personal_access_token: "a9f8ea924388df20d055cdb79ef9d24f8d0b4f2b",
git_url: "https://api.github.com/graphql"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
