# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_example,
  namespace: PhxExample

# Configures the endpoint
config :phoenix_example, PhxExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wUfn2WTDvKICn4CPXXJWd9AmcmH3nIQr5vPceaZz//a7fLCELv7Jd1Gx+3jwuJ0F",
  render_errors: [view: PhxExampleWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxExample.PubSub,
  live_view: [signing_salt: "rtP5BsMt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
