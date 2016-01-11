defmodule Woolly.Inflector do
  @moduledoc ~S"""
  An inflection module.

  The `Woolly.Inflector` is a rails like inflection module for
  the elixir programming language. Various inflections include:

    - Camelize  
    - Orindalize
    - Parameterize
    - Pluralize / Singularize
    - Underscore
  """

  @doc ~S"""
  Camelizes or pascalizes string and atoms.
  """
  defdelegate [camelize(word), camelize(word, option)], to: Woolly.Inflector.Camelize

  @doc ~S"""
  Returns the ordinal of a number.
  """
  defdelegate [ordinalize(number)], to: Woolly.Inflector.Ordinalize

  @doc ~S"""
  Parameterizes a string based on a given seperator.
  """
  defdelegate [parameterize(input), parameterize(input, sep)], to: Woolly.Inflector.Parameterize

  @doc ~S"""
  Pluralizses a word.
  """
  defdelegate [pluralize(word)], to: Woolly.Inflector.Pluralize

  @doc ~S"""
  Singularizes a word.
  """
  defdelegate [singularize(word)], to: Woolly.Inflector.Pluralize

  @doc ~S"""
  Underscore and lowercase a string.
  """
  defdelegate [underscore(word)], to: Woolly.Inflector.Underscore
end
