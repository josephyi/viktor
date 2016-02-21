defmodule Viktor.LolStatus do
  import Viktor.Base
  @moduledoc false

  def shards, do: "http://status.leagueoflegends.com/shards" |> get
  def shards(region), do: "http://status.leagueoflegends.com/shards/#{region}" |> get
end