defmodule Viktor.Team do
  import Viktor.Base
  @moduledoc false

  @team_path "/v2.4/team"

  def by_summoner_ids(region, summoner_ids) do
    request(region, "#{@team_path}/by-summoner/#{summoner_ids}")
  end

  def by_team_ids(region, team_ids) do
    request(region, "#{@team_path}/#{team_ids}")
  end

end