defmodule Woolly.Inflector.Parameterize do
  @moduledoc """
  # Parameterize

  Takes a list of string `input` and concatenates
  them together using the `connector`.
  """
  
  def parameterize(input, connector \\ "-") do
    Regex.split(~r/\s|%20/, input)
    |> Enum.join(connector)
    |> String.downcase()
  end

end
