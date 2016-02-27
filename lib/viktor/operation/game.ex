defmodule Viktor.Operation.Game do
  import Viktor.Base

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
end