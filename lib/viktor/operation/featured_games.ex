defmodule Viktor.Operation.FeaturedGames do
  import Viktor.Base
  @moduledoc """
  Wrapper for Featured Games endpoint.
  """

  @doc """
  Get current game information for the given summoner ID.

  ## Examples
  ```elixir
  featured_games = Viktor.Operation.FeaturedGames.featured_games("na")
  ```
  """
  def featured_games(region) do
    region_info(region) |> url |> add_params([]) |> get
  end

  defp url({:ok, region_data}) do
    "https://#{region_data[:host]}/observer-mode/rest/featured"
  end
end