defmodule Woolly.Inflector.Parameterize do
  @moduledoc false
  
  def parameterize(input, connector \\ "-") do
    Regex.split(~r/\s|%20/, input)
    |> Enum.join(connector)
    |> String.downcase()
  end

end
