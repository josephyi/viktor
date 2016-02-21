defmodule Viktor.Summoner do
  import Viktor.Base

  @summoner_path "/v1.4/summoner"

  @moduledoc false

  def by_account(region, account_ids) do
    request(region, "#{@summoner_path}/by-account/#{account_ids}")
  end

  def by_name(region, summoner_names) do
    request(region, "#{@summoner_path}/by-name/#{summoner_names}")
  end

  def by_summoner_ids(region, summoner_ids) do
    request(region, "#{@summoner_path}/by-name/#{summoner_ids}")
  end

  def masteries(region, summoner_ids) do
    request(region, "#{@summoner_path}/#{summoner_ids}/masteries")
  end

  def name(region, summoner_ids) do
    request(region, "#{@summoner_path}/#{summoner_ids}/name")
  end

  def runes(region, summoner_ids) do
    request(region, "#{@summoner_path}/#{summoner_ids}/runes")
  end
end