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

  @doc """
  API Key

  ## Examples
  ```elixir
  Viktor.api_key
  ```
  """
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
  all_champions = Viktor.champion("na")
  free_champions = Viktor.champion("na", true)
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
  defdelegate mastery_score(region, summoner_id), to: ChampionMastery, as: :score

  @doc """
  Gets all champion masteries for a summoner.

  ## Examples
  ```elixir
  masteries = Viktor.champion_masteries("na", 21066)
  ```
  """
  defdelegate champion_masteries(region, summoner_id), to: ChampionMastery, as: :champions

  @doc """
  Gets all champion masteries for a summoner.

  ## Examples
  ```elixir
  mastery = Viktor.champion_mastery("na", 21066, 1)
  ```
  """
  defdelegate champion_mastery(region, summoner_id, champion_id), to: ChampionMastery, as: :champion

  @doc """
  Get specified number of top champion mastery entries sorted by number of champion points descending.

  ## Examples
  ```elixir
  default_is_3 = Viktor.top_champion_masteries("na", 21066)
  top_10 = Viktor.top_champion_masteries("na", 21066, 10)
  ```
  """
  defdelegate top_champion_masteries(region, summoner_id), to: ChampionMastery, as: :topchampions

  @doc """
  Get current game information for the given summoner ID.

  ## Examples
  ```elixir
  current_game = Viktor.current_game("na", 21066)
  ```
  """
  defdelegate current_game(region, summoner_id), to: CurrentGame

  @doc """
  Get list of featured_games.

  ## Examples
  ```elixir
  featured_games = Viktor.featured_games("na")
  ```
  """
  defdelegate featured_games(region), to: FeaturedGames

  @doc """
  Get recent games by summoner ID.

  ## Examples
  ```elixir
  recent_games = Viktor.recent_games("na", 21066)
  ```
  """
  defdelegate recent_games(region, summoner_id), to: Game, as: :recent

  @doc """
  Get challenger tier leagues.

  ## Examples
  ```elixir
  challenger_league = Viktor.challenger_league("na", "RANKED_SOLO_5x5")
  ```
  """
  defdelegate challenger_league(region, type), to: League, as: :challenger

  @doc """
  Get master tier leagues.

  ## Examples
  ```elixir
  master_league = Viktor.master_league("na", "RANKED_SOLO_5x5")
  ```
  """
  defdelegate master_league(region, type), to: League, as: :master

  @doc """
  Get leagues mapped by summoner ID for a given list of summoner IDs.

  ## Examples
  ```elixir
  leagues = Viktor.leagues("na", "21066")
  ```
  """
  defdelegate leagues(region, summoner_ids), to: League, as: :by_summoner

  @doc """
  Get league entries mapped by summoner ID for a given list of summoner IDs.

  ## Examples
  ```elixir
  league_entries = Viktor.league_entries("na", "21066")
  ```
  """
  defdelegate league_entries(region, summoner_ids), to: League, as: :by_summoner_entry

  @doc """
  Get leagues mapped by team ID for a given list of team IDs.

  ## Examples
  ```elixir
  team_leagues = Viktor.team_leagues("na", "TEAM-fa073ee0-51ca-11e4-82cc-782bcb4d0bb2")
  ```
  """
  defdelegate team_leagues(region, team_ids), to: League, as: :by_team

  @doc """
  Get league entries mapped by team ID for a given list of team IDs.

  ## Examples
  ```elixir
  team_league_entries = Viktor.team_league_entries("na", "TEAM-fa073ee0-51ca-11e4-82cc-782bcb4d0bb2")
  ```
  """
  defdelegate team_league_entries(region, team_ids), to: League, as: :by_team_entry

  @doc """
  Retrieve match by match ID.

  ## Examples
  ```elixir
  match = Viktor.match("na", 2077473238)
  ```
  """
  defdelegate match(region, match_id), to: Match

  @doc """
  Retrieve match by match ID.

  ## Examples
  ```elixir
  match = Viktor.match("na", 2077473238, true)
  ```
  """
  defdelegate match(region, match_id, include_timeline), to: Match

  defdelegate match_list(region, summoner_id), to: MatchList
  defdelegate match_list(region, summoner_id, params), to: MatchList


end
