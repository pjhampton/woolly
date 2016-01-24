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

  Stems a token using the Porter Stemming algorithm

  """
  def stem(word) do
    word
    # |> step1ab
    # |> step1c
    # |> step2
    # |> step3
    # |> step4
    # |> step5
  end

end
