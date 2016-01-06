defmodule Woolly.Inflector.Underscore do
  @moduledoc false

  def underscore(atom) when is_atom(atom) do
    case Atom.to_string(atom) do
      "Elixir." <> rest -> underscore(rest)
      word -> underscore(word)
    end
  end

  def underscore(binary) when is_binary(binary) do
    binary
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    |> String.replace(~r/-/, "_")
    |> String.replace(~r/\s/, "_")
    |> String.downcase()
  end

end
