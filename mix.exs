defmodule Viktor.Mixfile do
  use Mix.Project

  def project do
    [app: :viktor,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  defp deps do
    [ {:httpoison, "~> 0.8.0"}, { :poison, "~> 2.0"} ]
  end
end
