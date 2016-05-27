defmodule Viktor.HTTP do
  use HTTPoison.Base

  def process_response(%HTTPoison.Response{body: body}), do: Poison.Parser.parse!(body)
  def process_response(response), do: response
end
