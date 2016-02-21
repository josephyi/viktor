defmodule Viktor.MatchList do
  import Viktor.Base
  @moduledoc false

  def match_list(region, summoner_id, params \\ []) do
    request(region, "/v2.2/matchlist/by-summoner/#{summoner_id}", {:with_key, params})
  end
end