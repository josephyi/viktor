defmodule Viktor.Base do
  alias Viktor.HTTP

  @region_info %{
            br: [region: "br", platform_id: "BR1", host: "br.api.pvp.net"],
            eune: [region: "eune", platform_id: "EUN1", host: "eune.api.pvp.net"],
            euw: [region: "euw", platform_id: "EUW1", host: "euw.api.pvp.net"],
            jp: [region: "jp", platform_id: "JP1", host: "jp.api.pvp.net"],
            kr: [region: "kr", platform_id: "KR", host: "kr.api.pvp.net"],
            lan: [region: "lan", platform_id: "LA1", host: "lan.api.pvp.net"],
            las: [region: "las", platform_id: "LA2", host: "las.api.pvp.net"],
            na: [region: "na", platform_id: "NA1", host: "na.api.pvp.net"],
            oce: [region: "oce", platform_id: "OC1", host: "oce.api.pvp.net"],
            tr: [region: "tr", platform_id: "TR1", host: "tr.api.pvp.net"],
            ru: [region: "ru", platform_id: "RU", host: "ru.api.pvp.net"],
            pbe: [region: "pbe", platform_id: "PBE1", host: "pbe.api.pvp.net"]
  }

  @region_mapping @region_info |> Map.keys |> Enum.map(fn k -> {to_string(k), k} end) |> Enum.into(%{})

  def region_info, do: @region_info

  def region_info(region) when is_binary(region) do
    region_atom = @region_mapping[region]
    if region_atom, do: {:ok, region_atom} |> region_info, else: {:error, "Region not found: #{region}"}
  end

  def region_info({:ok, region_atom}) do
    region_data = @region_info[region_atom]
    if region_data, do: {:ok, region_data}, else: {:error, "Region not found: :#{region_atom}"}
  end

  def regional_endpoint(region) when is_binary(region), do: region_info(region) |> regional_endpoint
  def regional_endpoint({:ok, region_data}), do: "https://#{region_data[:host]}/api/lol/#{region_data[:region]}"

  def request(region, path), do: request(region, path, {:with_key, []})
  def request(region, path, {:with_key, params}) do
     (regional_endpoint(region) <> path) |> add_params(params) |> get
  end

  def get(url), do: HTTP.request!(:get, url, "", [], [])

  def add_params(url, params, with_key \\ true) do
    if with_key do
      url |> add_params_to_url(params ++ [api_key: Viktor.api_key])
    else
      url |> add_params_to_url(params)
    end
  end

  def add_params_to_url(url, params), do: url <> build_qs(params |> Enum.filter(fn {_, v} -> v end))
  defp build_qs([]), do: ""
  defp build_qs(kvs), do: to_string('?' ++ URI.encode_query(kvs))
end
