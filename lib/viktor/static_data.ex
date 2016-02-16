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
    request(region, "/champion/#{id}", [locale: locale, version: version, itemData: item_data])
  end

  def language_strings(region, locale, version) do
    request(region, "/language-strings", [locale: locale, version: version]
  end

  def map(region, locale, version) do
    request(region, "/map", [locale: locale, version: version]
  end

  def mastery(region, locale, version, mastery_list_data) do
    request(region, "/mastery", [locale: locale, version: version, masteryListData: mastery_list_data]
  end

  def mastery(region, id, locale, version, mastery_data) do
    request(region, "/mastery/#{id}", [locale: locale, version: version, masteryData: mastery_data]
  end

  def realm(region), do: request(region, "/realm")

  def rune(region, locale, version, rune_list_data) do
    request(region, "/rune", [locale: locale, version: version, runeListData: rune_list_data]
  end

  def rune(region, id, locale, version, rune_data) do
    request(region, "/rune/#{id}", [locale: locale, version: version, runeData: rune_data]
  end

  def summoner_spell(region, locale, version, data_by_id, spell_data) do
    request(region, "/summoner-spell", [locale: locale, version: version, dataById: data_by_id, spellData: spell_data])
  end

  def summoner_spell(region, id, locale, version, spell_data) do
    request(region, "/summoner-spell/#{id}", [locale: locale, version: version, spellData: spell_data])
  end

  def version(region), do: request(region, "/versions")

  defp request(region, action, params \\ []) do
    region_info(region) |> url(action) |> add_params(params) |> get
  end

  defp url({:ok, region_data}, action) do
    "https://global.api.pvp.net/api/lol/static-data/#{region_data[:region]}/v1.2" <> action
  end
end