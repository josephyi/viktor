defmodule Viktor.Game do
  import Viktor.Base

  def recent(region, summoner_id) do
    region_info(region) |> regional_endpoint |> recent_games_path(summoner_id) |> add_params([]) |> get
  end

  defp recent_games_path(url, summoner_id) do
    url <> "/v1.3/game/by-summoner/#{summoner_id}/recent"
  end

end