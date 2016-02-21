defmodule Viktor.StaticData do
  import Viktor.Base
  @moduledoc false

  def champion(region, locale \\ nil, arg2 \\ nil, arg3 \\ nil, arg4 \\ nil)

  def champion(region, id, locale, version, champ_data) when is_integer(id) do
    static_request(region, "/champion/#{id}", [locale: locale, version: version, champData: champ_data])
  end

  def champion(region, locale, version, data_by_id, champ_data)  do
    static_request(region, "/champion", [locale: locale, version: version, dataById: data_by_id, champData: champ_data])
  end


  def item(region, id, locale, version, item_data) when is_integer(id) do
    static_request(region, "/item/#{id}", [locale: locale, version: version, itemData: item_data])
  end

  def item(region, arg \\ nil, arg \\ nil, arg \\ nil)
  def item(region, locale, version, item_list_data) when is_binary(locale) do
    static_request(region, "/item", [locale: locale, version: version, itemListData: item_list_data])
  end

  def language_strings(region, locale \\ nil, version \\ nil) do
    static_request(region, "/language-strings", [locale: locale, version: version])
  end

  def map(region, locale, version) do
    static_request(region, "/map", [locale: locale, version: version])
  end

  def mastery(region, arg \\ nil, arg \\ nil, arg \\ nil)

  def mastery(region, locale, version, mastery_list_data) do
    static_request(region, "/mastery", [locale: locale, version: version, masteryListData: mastery_list_data])
  end

  def mastery(region, id, locale, version, mastery_data) do
    static_request(region, "/mastery/#{id}", [locale: locale, version: version, masteryData: mastery_data])
  end

  def realm(region), do: static_request(region, "/realm")

  def rune(region, arg \\ nil, arg \\ nil, arg \\ nil)

  def rune(region, locale , version , rune_list_data ) do
    static_request(region, "/rune", [locale: locale, version: version, runeListData: rune_list_data])
  end

  def rune(region, id, locale , version , rune_data ) do
    static_request(region, "/rune/#{id}", [locale: locale, version: version, runeData: rune_data])
  end

  def summoner_spell(region, arg \\ nil, arg \\ nil, arg \\ nil, arg \\ nil)

  def summoner_spell(region, locale , version , data_by_id, spell_data ) when is_binary(locale) do
    static_request(region, "/summoner-spell", [locale: locale, version: version, dataById: data_by_id, spellData: spell_data])
  end

  def summoner_spell(region, id, locale , version , spell_data ) when is_integer(id) do
    static_request(region, "/summoner-spell/#{id}", [locale: locale, version: version, spellData: spell_data])
  end

  def version(region), do: static_request(region, "/versions")

  defp static_request(region, action, params \\ []) do
    region_info(region) |> url(action) |> add_params(params) |> get
  end

  defp url({:ok, region_data}, action) do
    "https://global.api.pvp.net/api/lol/static-data/#{region_data[:region]}/v1.2" <> action
  end
end