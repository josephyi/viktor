defmodule Viktor.StaticData do
  @moduledoc false

  def champion(region, locale, version, data_by_id, champ_data) do
    request(region, "/champion", [locale: locale, version: version, dataById: data_by_id, champData: champ_data])
  end

  def champion(region, id, locale, version, champ_data) do
    request(region, "/champion/#{id}", [locale: locale, version: version, champData: champ_data])
  end

  def item(region, locale, version, item_list_data) do
    request(region, "/champion/#{id}", [locale: locale, version: version, itemListData: item_list_data])
  end

  def item(region, id, locale, version, item_list_data) do
    request(region, "/champion/#{id}", [locale: locale, version: version, itemListData: item_list_data])
  end

  def language_strings(region, locale, version) do
    request(region, "/language-strings", [locale: locale, version: version]
  end

  def map(region, locale, version) do
    request(region, "/map", [locale: locale, version: version]
  end

  def request(region, action, params \\ []) do
    region_info(region) |> url(action) |> add_params(params) |> get
  end

  defp url({:ok, region_data}, action) do
    "https://global.api.pvp.net/api/lol/static-data/#{region_data[:region]}/v1.2" <> action
  end
end