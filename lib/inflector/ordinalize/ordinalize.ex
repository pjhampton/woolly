defmodule Woolly.Inflector.Ordinalize do
  @moduledoc false

  def ordinalize(number) do
    cond do
      number == 11 ->
        "11th"
      number == 12 ->
        "12th"
      number == 13 ->
        "13th"
      number == 14 ->
        "14th"
      rem(number, 10) == 1 ->
        Integer.to_string(number) <> "st"
      rem(number, 10) == 2 ->
        Integer.to_string(number) <> "nd"
      rem(number, 10) == 3 ->
        Integer.to_string(number) <> "rd"
      true ->
        Integer.to_string(number) <> "th"
    end
  end
  
end
