defmodule Viktor.ChampionMastery do
  import Viktor.Base

  def score(region, summoner_id), do: request(region, summoner_id, "/score")

  def champion(region, summoner_id, champion_id), do: request(region, summoner_id, "/champion/#{champion_id}")

  def champions(region, summoner_id), do: request(region, summoner_id, "/champions")

  def topchampions(region, summoner_id, count \\ 3), do: request(region, summoner_id, "/topchampions", [count: count])

  defp request(region, summoner_id, action, params \\ []) do
    region_info(region) |> url(summoner_id, action) |> add_params(params) |> get
  end

  defp url({:ok, region_data}, summoner_id, action) do
    "https://#{region_data[:host]}/championmastery/location/#{region_data[:platform_id]}/player/#{summoner_id}" <> action
  end

end
