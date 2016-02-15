defmodule Viktor.Mixfile do
  use Mix.Project

  def project do
    [app: :viktor,
     version: "0.0.3",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  defp deps do
    [ {:httpoison, "~> 0.8.0"},
      {:poison, "~> 2.0"},
      {:inch_ex, only: :docs}
    ]
  end

  defp description do
    """
    Client API wrapper for League of Legends API.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE*"],
      maintainers: ["Joseph Yi"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/josephyi/viktor"}
    ]
  end
end
