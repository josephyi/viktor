defmodule Viktor.Game do
  import Viktor.Base
  import Viktor.CurrentGame
  import Viktor.FeaturedGames

  @moduledoc """
  Wrapper for Game endpoint.
  """

  @doc """
  Get recent games by summoner ID.

  ## Examples
  ```elixir
  recent_games = Viktor.Game.recent("na", 21066)
  ```
  """
  def recent(region, summoner_id) do
    request(region, "/v1.3/game/by-summoner/#{summoner_id}/recent")
  end

  def current(region, summoner_id), do: current_game(region, summoner_id)

  def featured(region), do: featured_games(region)
end