defmodule Viktor.Champion do
  import Viktor.Base

  @champion_path "/v1.2/champion"

  def champion(region, arg \\ nil)

  def champion(region, id) when is_integer(id) do
    request(region, "#{@champion_path}/#{id}")
  end

  def champion(region, free_to_play) do
    request(region, @champion_path, {:with_key, freeToPlay: free_to_play})
  end
end