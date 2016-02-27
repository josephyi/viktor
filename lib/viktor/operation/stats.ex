defmodule Viktor.Operation.Stats do
  import Viktor.Base
  @moduledoc false

  @stats_path "/v1.3/stats/by-summoner"

  def ranked(region, summoner_id, season \\ nil) do
    request(region, "#{@stats_path}/#{summoner_id}/ranked", {:with_key, season: season})
  end

  def summary(region, summoner_id, season \\ nil) do
    request(region, "#{@stats_path}/#{summoner_id}/summary", {:with_key, season: season})
  end

end