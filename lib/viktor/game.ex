defmodule Viktor.Game do
  import Viktor.Base

  def recent(region, summoner_id) do
    request(region, "/v1.3/game/by-summoner/#{summoner_id}/recent")
  end
end