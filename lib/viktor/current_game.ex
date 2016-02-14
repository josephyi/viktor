defmodule Viktor.CurrentGame do
  import Viktor.Base

  def current_game(region, summoner_id) do
    region_info(region) |> url(summoner_id) |> add_params([]) |> get
  end

  defp url({:ok, region_data}, summoner_id) do
    "https://#{region_data[:host]}/observer-mode/rest/consumer/getSpectatorGameInfo/#{region_data[:platform_id]}/#{summoner_id}"
  end
end