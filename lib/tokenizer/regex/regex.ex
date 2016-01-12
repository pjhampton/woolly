defmodule Woolly.Tokenizer.Regex do
  @moduledoc ~S"""
  A Regular-Expression based Tokenizer
 
  ## Overview

  The `Regex.tokenize` splits a string, or list of
  strings using regular expressions. Regular Expression
  based tokenizers tend to work on germanic and romantic
  languages due to their inherit syntactical stuctures.

  ## Limitations

  Hand crafted patterns and finite state automata have
  never been a flexible solution for analysing messy
  language, which tends to be most of natural language.
  A Regular Expression based tokenizer may not perform
  well on human generated output such as tweets, chat
  discussions and text messages. Lastly, language evolves
  and due to the atomic nature, will never evolve in parellel.
  """

  def tokenize(sent) when is_binary(sent) do
    sent = Regex.replace(~r{\.}, sent, " .")
    sent = Regex.replace(~r{\,}, sent, " ,")
    sent = Regex.replace(~r{\;}, sent, " ;")
    sent = Regex.replace(~r{\?}, sent, " ?")
    sent = Regex.replace(~r{\!}, sent, " !")
    |> String.split()
  end

  def whitespace_tokenize(sent) when is_binary(sent) do
    sent
    |> String.split()
  end

  def blankline_tokenize(sent) when is_binary(sent) do
    sent = Regex.split(~r{\n}, sent)
    |> Enum.reject(fn(x) -> x == "" end) 
  end
end
