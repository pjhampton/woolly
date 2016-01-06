defmodule Woolly.Inflector do

  defdelegate [camelize(word), camelize(word, option)], to: Woolly.Inflector.Camelize

  defdelegate [parameterize(input), parameterize(input, connector)], to: Woolly.Inflector.Parameterize
end
