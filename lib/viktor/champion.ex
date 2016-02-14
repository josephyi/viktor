defmodule Viktor.Champion do
  import Viktor.Base

  @champion_path "/v1.2/champion"

  def champion(region, arg \\ nil)

  def champion(region, id) when is_integer(id) do
    region_info(region) |> regional_endpoint |> champion_path(id) |> add_params([]) |> get
  end

  def champion(region, free_to_play) do
    region_info(region) |> regional_endpoint |> champion_path |> add_params([freeToPlay: free_to_play]) |> get
  end

  defp champion_path(url), do: url <> @champion_path
  defp champion_path(url, id), do: url <> @champion_path <> "/#{id}"
end