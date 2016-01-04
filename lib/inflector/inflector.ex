defmodule Woolly.Inflector do

  defdelegate [camelize(input), camelize(input, :type)], to: Woolly.Inflector.Camelize

  defdelegate [parameterize(input), parameterize(input, connector)], to: Woolly.Inflector.Parameterize
end
