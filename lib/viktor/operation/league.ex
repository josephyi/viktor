defmodule Viktor.Operation.League do
  import Viktor.Base

  @league_path "/v2.5/league"

  def by_summoner(region, summoner_ids), do: request(region, "#{@league_path}/by-summoner/#{summoner_ids}")

  def by_summoner_entry(region, summoner_ids), do: request(region, "#{@league_path}/by-summoner/#{summoner_ids}/entry")

  def by_team(region, team_ids), do: request(region, "#{@league_path}/by-team/#{team_ids}")

  def by_team_entry(region, team_ids), do: request(region, "#{@league_path}/by-team/#{team_ids}/entry")

  def challenger(region, type), do: request(region, "#{@league_path}/challenger", {:with_key, type: type})

  def master(region, type), do: request(region, "#{@league_path}/master", {:with_key, type: type})

end