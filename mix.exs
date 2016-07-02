defmodule Viktor.Mixfile do
  use Mix.Project

  def project do
    [app: :viktor,
     version: "0.2.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: description,
     package: package]
  end

  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  defp deps do
    [ {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.2"},
      {:inch_ex, only: :docs},
      {:ex_doc, "~> 0.12", only: :dev},
      {:earmark, "~> 0.2", only: :dev}
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
