defmodule Viktor.HTTP do
  use HTTPoison.Base

  def process_response_body(body), do: Poison.Parser.parse!(body)

end

