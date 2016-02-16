defmodule Viktor.League do
  import Viktor.Base

  @league_path "/v2.5/league"

  def by_summoner(region, summoner_ids), do: request(region, "/by-summoner/#{summoner_ids}")

  def by_summoner_entry(region, summoner_ids), do: request(region, "/by-summoner/#{summoner_ids}/entry")

  def by_team(region, team_ids), do: request(region, "/by-team/#{team_ids}")

  def by_team_entry(region, team_ids), do: request(region, "/by-team/#{team_ids}/entry")

  def challenger(region, type), do: request(region, "/challenger", [type: type])

  def master(region, type), do: request(region, "/master", [type: type])

  defp request(region, action, params \\ []) do
    region_info(region) |> regional_endpoint |> url(action) |> add_params(params) |> get
  end

  defp url(url, action), do: url <> @league_path <> action
end