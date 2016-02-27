defmodule Viktor.Operation.Match do
  import Viktor.Base
  @moduledoc false

  @match_path "/v2.2/match"

  def tournament_match_ids(region, tournament_code), do: request(region, "#{@match_path}/by-tournament/#{tournament_code}/ids", {:with_key, []})
  def match(region, match_id, include_timeline \\ nil), do: request(region, "#{@match_path}/#{match_id}", {:with_key, [includeTimeline: include_timeline]})
  def tournament_match(region, match_id, tournament_code, include_timeline \\ nil) do
    request(region, "#{@match_path}/for-tournament/#{match_id}", {:with_key, [includeTimeline: include_timeline, tournamentCode: tournament_code]})
  end
end