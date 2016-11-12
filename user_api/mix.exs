defmodule UserApi.Mixfile do
  use Mix.Project

  def project do
    [app: :user_api,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :maru, :ecto, :postgrex],
      mod: {UserApi,[]}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poison, "~> 2.0"}, #due to ecto 2.0 requires it
      {:maru, "~> 0.10"},
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.0.0"},
      {:json, "~> 1.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": [
        "ecto.drop", "ecto.create",  "ecto.load", "ecto.migrate", "test"
      ],
      "test": [
        "ecto.setup"
      ]
    ]
  end
end

