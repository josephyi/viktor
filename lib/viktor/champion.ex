defmodule Viktor.Champion do
  import Viktor.Base
  @moduledoc """
  Wrapper for Champion endpoint.
  """
  @champion_path "/v1.2/champion"

  def champion(region, arg \\ nil)

  @doc """
  Retrieve champion by ID.

  ## Examples
  ```elixir
  champion = Viktor.Champion.champion("na", 1)
  ```
  """
  def champion(region, id) when is_integer(id) do
    request(region, "#{@champion_path}/#{id}")
  end

  @doc """
  Retrieve all champions.

  ## Examples
  All Champions
  ```elixir
  all_champions = Viktor.Champion.champion("na")
  free_champions = Viktor.Champion.champion("na", true)
  ```
  """
  def champion(region, free_to_play) do
    request(region, @champion_path, {:with_key, freeToPlay: free_to_play})
  end
end