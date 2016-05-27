[![Build Status](https://travis-ci.org/josephyi/viktor.svg?branch=master)](https://travis-ci.org/josephyi/viktor)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/josephyi/viktor.svg)](https://beta.hexfaktor.org/github/josephyi/viktor)
[![Inline docs](http://inch-ci.org/github/josephyi/viktor.svg?branch=master)](http://inch-ci.org/github/josephyi/viktor)

# Viktor

> "Function over form."

Viktor is an Elixir interface to Riot Games' League of Legends API named after a character in the game.

## Prerequisite

> "Join the glorious evolution."

Sign up for an API key at [Riot Games Developer] site.

## Installation

> "Pave the way."

Add viktor to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:viktor, "~> 0.0.8"}]
end
```

Ensure viktor is started before your application:

```elixir
def application do
  [applications: [:viktor]]
end
```

Test in iex:

```console
mix deps.get
iex -S mix
```

## Usage

Set the `RIOT_API_KEY` environment variable.

```console
export RIOT_API_KEY=whatever_key_rito_assigned_you
```

Viktor uses Elixir's [Agent] to manage the API key between requests, so you must call `start_link/0`.

If `RIOT_API_KEY` is set

```elixir
Viktor.start_link
```

You may also set the key using `start_link/1`

```elixir
Viktor.start_link("whatever_key_rito_assigned_you")
```

## Examples

I'm in the process of making this a little more pleasant by providing the functions off the root module. These examples will work, but see the [documentation] for details.

```elixir
Viktor.start_link
champion_list = Viktor.champions("na")
champion_list_free_week = Viktor.champions("na", true)
champion_by_id = Viktor.champion("na", 1)
champion_mastery_score = Viktor.mastery_score("na", 21066)
champion_mastery_champion = Viktor.champion_mastery("na", 21066, 1)
champion_mastery_champions = Viktor.champion_masteries("na", 21066)
champion_mastery_3_topchampions = Viktor.top_champion_masteries("na", 21066)
champion_mastery_5_topchampions = Viktor.top_champion_masteries("na", 21066, 5)
current_game = Viktor.current_game("na", 21066)
featured_games = Viktor.featured_games("na")
```

All that's left are the tournament endpoints!

## Other API Libraries

Be sure to check out the other libraries out there!

[velkoz]

[documentation]:https://hexdocs.pm/viktor/0.0.8/Viktor.html#content
[velkoz]:https://github.com/Tim-Machine/velkoz
[Agent]:http://elixir-lang.org/getting-started/mix-otp/agent.html
[Riot Games Developer]:https://developer.riotgames.com/
