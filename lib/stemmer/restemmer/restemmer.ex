defmodule Woolly.Stemmer.Restemmer do
  @moduledoc ~S"""
  A Regex Based Stemmer.

  A stemming algorithm is a morphological tool for
  reducing a word to their word stem, base or root
  form. They have been a popular feature when text
  mining or natural language processing, retrieval
  systems in particular. 

  The Regex (Regular Expression) driven stemmer is
  provided by the `Woolly.Stemmer` module is more
  of a vanity feature than a production tool, used
  for experimentation and stemming using patterns.

      iex> import Woolly.Stemmer.Restemmer
      iex> stem("dogs", ~r/s$/)
      "dog"

      iex> alias Woolly.Stemmer.Restemmer
      iex> Restemmer.stem("cats", ~r/s$/, 5)
      "cats"
  """

  @doc ~S"""
  The `Woolly.Stemmer.Restemmer.stem/3` takes three
  parameters listed below. It takes the word as the
  first parameter and takes a regular expression as
  the second. It also takes a `min` (shortened from
  minimum) as a guard for the stemmer. If length of
  the word falls below this count it won't apply the
  the stemmer.

  ## Parameters

    - word (string) - a word to be stemmed
    - pattern (regex pattern) - The pattern
    - minimum (integer) - The minimum number of graphemes to work.
  """
  def stem(word, pattern, min) when is_binary(word) and is_number(min) do
    if String.length(word) >= min do
      Regex.replace(pattern, word, "") 
    else
      word
    end
  end

  @doc ~S"""
  The `Woolly.Stemmer.Restemmer.stem/2` takes three
  parameters listed below. It takes the word as the
  first parameter and takes a regular expression as
  the second. It also takes a `min` (shortened from
  minimum) as a guard for the stemmer. If length of
  the word falls below this count it won't apply the
  the stemmer.

  # Parameters

    - word (String) - a word to be stemmed
    - pattern - (regular pattern) The Regular Expression
  """
  def stem(word, pattern) when is_binary(word) do
    Regex.replace(pattern, word, "") 
  end

end
