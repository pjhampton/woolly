defmodule Woolly.Inflector.Parameterize do
  @moduledoc false
  
  def parameterize(input, sep \\ "-") do
    Regex.split(~r/\s|%20/, input)
    |> Enum.join(sep)
    |> String.downcase()
  end
end
