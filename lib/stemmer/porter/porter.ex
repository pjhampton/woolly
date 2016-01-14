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

  @irregular_forms []

  @doc """
  stem/1

  Stems a word using the Porter Stemming algorithm

  ## Parameters

    - word (String) - the word to be stemmed.

  """
  def stem(word) do
    # word
    # |> step1ab()
    # |> step1c()
    # |> step2()
    # |> step3()
    # |> step4()
    # |> step5()
  end

  @doc ~S"""
  step1ab/1 (private)

  Step 1 gets rid of plurals and -ed or -ing.
  """
  defp step1ab(word) do
  end

  @doc ~S"""
  step1c/1 (private)

  Step 1c turns terminal y -> i when there another
  vowel is present in the stem.
  """
  defp step1c(word) do
  end

  @doc ~S"""
  step2/1 (private)


  """
  defp step2(word) do
  end

  @doc ~S"""
  step3/1 (private)

  """
  defp step3(word) do
  end

  @doc ~S"""
  step4/1 (private)


  """
  defp step4(word) do
  end

  @doc ~S"""
  step5/1 (private)


  """
  defp step5(word) do
  end
 
  @doc ~S"""
  adjust_case/2 (private)

  """
  defp adjust_case(word, stem) do 
  end

end
