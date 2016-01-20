defmodule Woolly.Stemmer.Porter do
  @moduledoc ~S"""
  The Porter Stemming Algorithm

  This is the Porter stemming algorihm, ported to
  the elixir programming language from the ANSI C
  verion by Martin Porter, the original author of
  this algorithm and the paper describing it -

  > Porter, M. "An algorithm for suffix stripping."
  > Program 14.3 (1980): 130-137.

  A stemming algorithm is a morphological tool for
  reducing a word to their word stem, base or root
  form. They have been a popular feature when text
  mining or natural language processing, retrieval
  systems in particular. 

  If you implement `Woolly.Stemmer.Porter`, please
  consider crediting the above paper and Woolly...
  """

  @vowels ["a", "e", "i", "o", "u"]

  """
  It should come as no suprise that there is a table
  of irregular forms. It reflects various numerous
  errors that has been brought to the attention of
  Martin Porter. If you feel there is more, you should
  modify the list below. 
  """
  @irregular_forms [
    {~r/skies/i, "sky"},
    {~r/sky/i, "sky"},
    {~r/dying/i, "die"},
    {~r/lying/i, "lie"},
    {~r/tying/i, "tie"},
    {~r/news/i, "news"},
    {~r/inning(s?)/i, "inning"},
    {~r/outing(s?)/i, "outing"},
    {~r/canning(s?)/i, "canning"},
    {~r/howe/i, "howe"},
    {~r/proceed/i, "proceed"},
    {~r/exceed/i, "exceed"},
    {~r/succeed/i, "succeed"},
  ]

  @doc """
  stem/1

  Stems a word using the Porter Stemming algorithm

  ## Parameters

    - word (String) - The word to be stemmed.

  """
  def stem(word) do
    # word |> step1ab |> step1c |> step2 |> step3 |> step4 |> step5
  end

  defp _cons(word, i) do
  end

  defp _m(word, j) do
  end

  def step1ab(word) do
    cond do
      String.at(word, -1) == "s" ->
        word |> strip1
      String.ends_with?(word, "ied") ->
        word |> strip2
      String.ends_with?(word, "eed") ->
        word |> strip3
      String.ends_with?(word, "ed") ->
        word |> strip4
      String.ends_with?(word, "ing") ->
        word |> strip5
      true ->
        word
    end
  end

  defp step1c(word) do
  end

  defp step2(word) do
  end

  defp step3(word) do
  end

  defp step4(word) do
  end

  defp step5(word) do
  end
 
  defp adjust_case(word, stem) do 
  end

  def strip1(word) do
    cond do
      String.ends_with?(word, "sses") ->
        word |> String.slice(0..String.length(word)-3)
      String.ends_with?(word, "ies") ->
        if String.length(word) == 4 do
          word |> String.slice(0..String.length(word)-2)
        else
          word |> String.slice(0..String.length(word)-3)
        end
      # 2nd last letter != s
      # word |> String.slice(0..String.length(word)-2)
      true -> word
    end
  end

  def strip2(word) do
    if String.length(word) == 4 do
      word |> String.slice(0..String.length(word)-2)
    else
      word |> String.slice(0..String.length(word)-3)
    end
  end

  def strip3(word) do
    word |> String.slice(0..String.length(word)-2)
  end

  def strip4(word) do
    word |> String.slice(0..String.length(word)-3)
  end

  def strip5(word) do
    word |> String.slice(0..String.length(word)-4)
  end

end
