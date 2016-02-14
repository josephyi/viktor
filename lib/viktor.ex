defmodule Viktor do
  def start_link do
    start_link(Application.get_env(:leblanc, :riot_api_key, System.get_env("RIOT_API_KEY")))
  end

  def start_link(api_key) do
    Agent.start_link(fn -> api_key end, name: __MODULE__)
  end

  def api_key do
    Agent.get(__MODULE__, fn(state) -> state end)
  end
end
