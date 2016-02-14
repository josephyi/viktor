defmodule Viktor.HTTP do
  use HTTPoison.Base

  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: Poison.Parser.parse!(body, keys: :atoms)
end
