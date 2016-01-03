defmodule Woolly.Inflector do

  defdelegate [parameterize(input), parameterize(input, connector)], to: Woolly.Inflector.Parameterize
end
