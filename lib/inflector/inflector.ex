defmodule Woolly.Inflector do

  defdelegate [camelize(word), camelize(word, option)], to: Woolly.Inflector.Camelize

  defdelegate [ordinalize(number)], to: Woolly.Inflector.Ordinalize

  defdelegate [parameterize(input), parameterize(input, connector)], to: Woolly.Inflector.Parameterize

  defdelegate [pluralize(word), singularize(word)], to: Woolly.Inflector.Pluralize

  defdelegate [underscore(word)], to: Woolly.Inflector.Underscore

end
