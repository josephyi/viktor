defmodule Viktor.ChampionMastery do
  import Viktor.Base
  @moduledoc """
  Wrapper for Champion Mastery endpoint.
  """

  @doc """
  Get a player's total champion mastery score, which is sum of individual champion mastery levels.

  ## Examples
  ```elixir
  score = Viktor.ChampionMastery.score("na", 21066)
  ```
  """
  def score(region, summoner_id), do: mastery_request(region, summoner_id, "/score")

  @doc """
  Get a champion mastery by player id and champion id. Response code 204 means there were no masteries found for given
  player id or player id and champion id combination.

  ## Examples
  ```elixir
  champion = Viktor.ChampionMastery.champion("na", 21066, 5)
  ```
  """
  def champion(region, summoner_id, champion_id), do: mastery_request(region, summoner_id, "/champion/#{champion_id}")


  @doc """
  Get all champion mastery entries sorted by number of champion points descending.

  ## Examples
  ```elixir
  champion = Viktor.ChampionMastery.champions("na", 21066)
  ```
  """
  def champions(region, summoner_id), do: mastery_request(region, summoner_id, "/champions")

  @doc """
  Get specified number of top champion mastery entries sorted by number of champion points descending.

  ## Examples
  ```elixir
  default_is_3 = Viktor.ChampionMastery.topchampion("na", 21066)
  top_10 = Viktor.ChampionMastery.topchampion("na", 21066, 10)
  ```
  """
  def topchampions(region, summoner_id, count \\ 3), do: mastery_request(region, summoner_id, "/topchampions", [count: count])

  defp mastery_request(region, summoner_id, action, params \\ []) do
    region_info(region) |> url(summoner_id, action) |> add_params(params) |> get
  end

  defp url({:ok, region_data}, summoner_id, action) do
    "https://#{region_data[:host]}/championmastery/location/#{region_data[:platform_id]}/player/#{summoner_id}" <> action
  end

end
