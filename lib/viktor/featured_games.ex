defmodule Viktor.FeaturedGames do
  import Viktor.Base
  def featured_games(region) do
    region_info(region) |> url |> add_params([]) |> get
  end

  defp url({:ok, region_data}) do
    "https://#{region_data[:host]}/observer-mode/rest/featured"
  end
end