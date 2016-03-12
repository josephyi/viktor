defmodule Viktor.Operation.Stats do
  import Viktor.Base
  @moduledoc false

  @stats_path "/v1.3/stats/by-summoner"

  @doc """
  Get ranked stats by summoner ID.

  ## Examples
  ```elixir
  ranked = Viktor.Operation.Stats.ranked("na", 21066)
  ranked = Viktor.ranked_stats("na", 21066)
  ```
  """
  def ranked(region, summoner_id, season \\ nil) do
    request(region, "#{@stats_path}/#{summoner_id}/ranked", {:with_key, season: season})
  end

  @doc """
  Get player stats summaries by summoner ID.

  ## Examples
  summary = Viktor.Operation.Stats.summary("na", 21066)
  ranked = Viktor.summary_stats("na", 21066)
  ```
  """
  def summary(region, summoner_id, season \\ nil) do
    request(region, "#{@stats_path}/#{summoner_id}/summary", {:with_key, season: season})
  end

end