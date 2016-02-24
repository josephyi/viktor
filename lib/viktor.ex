defmodule Viktor do
  alias Viktor.{Champion, ChampionMastery, CurrentGame, FeaturedGames, Game, League, Match, MatchList}
  @moduledoc """
  Viktor

  ## Examples
  ```elixir
  Viktor.start_link
  current_game = Viktor.current_game("na", 21066)
  ```
  """

  def start_link do
    start_link(Application.get_env(:viktor, :riot_api_key, System.get_env("RIOT_API_KEY")))
  end

  def start_link(api_key) do
    Agent.start_link(fn -> api_key end, name: __MODULE__)
  end

  def api_key do
    Agent.get(__MODULE__, fn(state) -> state end)
  end

  @doc """
  Retrieve champion by ID.

  ## Examples
  ```elixir
  champion = Viktor.champion("na", 1)
  ```
  """
  def champion(region, id) when is_integer(id), do: Champion.champion(region, id)

  @doc """
  Retrieve all champions.

  ## Examples
  All Champions
  ```elixir
  all_champions = Viktor.Champion.champion("na")
  free_champions = Viktor.Champion.champion("na", true)
  ```
  """
  def champions(region, free_to_play), do: Champion.champion(region, free_to_play)

  @doc """
  Get a player's total champion mastery score, which is sum of individual champion mastery levels.

  ## Examples
  ```elixir
  mastery_score = Viktor.mastery_score("na", 21066)
  ```
  """
  def mastery_score(region, summoner_id), do: ChampionMastery.score(region, summoner_id)

  @doc """
  Gets all champion masteries for a summoner.

  ## Examples
  ```elixir
  masteries = Viktor.champion_masteries("na", 21066)
  ```
  """
  def champion_masteries(region, summoner_id), do: ChampionMastery.champions(region, summoner_id)

  @doc """
  Gets all champion masteries for a summoner.

  ## Examples
  ```elixir
  mastery = Viktor.champion_mastery("na", 21066, 1)
  ```
  """
  def champion_mastery(region, summoner_id, champion_id), do: ChampionMastery.champion(region, summoner_id, champion_id)

  @doc """
  Get current game information for the given summoner ID.

  ## Examples
  ```elixir
  current_game = Viktor.current_game("na", 21066)
  """
  def current_game(region, summoner_id), do: CurrentGame.current_game(region, summoner_id)

  @doc """
  Get list of featured_games

  ## Examples
  ```elixir
  featured_games = Viktor.featured_games("na")
  """
  def featured_games(region), do: FeaturedGames.featured_games(region)
  def recent_games(region, summoner_id), do: Game.recent(region, summoner_id)

  def challenger_league(region, type), do: League.challenger(region, type)
  def master_league(region, type), do: League.master(region, type)
  def leagues(region, summoner_ids), do: League.by_summoner(region, summoner_ids)
  def league_entries(region, summoner_ids), do: League.by_summoner_entry(region, summoner_ids)
  def team_leagues(region, team_ids), do: League.by_team(region, team_ids)
  def team_league_entries(region, team_ids), do: League.by_team_entry(region, team_ids)

  def match(region, match_id, include_timeline \\ nil), do: Match.match(region, match_id, include_timeline)

  def match_list(region, summoner_id, params \\ []), do: MatchList.match_list(region, summoner_id, params)


end
