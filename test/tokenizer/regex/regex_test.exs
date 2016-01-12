defmodule Woolly.Tokenizer.RegexTest do
  use ExUnit.Case, async: true

  import Woolly.Tokenizer.Regex

  test :regex_tokenizer do
    assert ["I", "am", "a", "teapot", "!"] == tokenize("I am a teapot!")
    assert ["What", "is", "your", "name", "?"] == tokenize("What is your name?")
    assert ["Who", "in", "the", "world", "am", "I", "?"] == tokenize("Who in the world am I?")
    assert ["Ah", ",", "that's", "the", "great", "puzzle"] == tokenize("Ah, that's the great puzzle")
    assert ["Curiouser", "and", "curiouser", "!"] == tokenize("Curiouser and curiouser!")
    assert ["Have", "I", "gone", "mad", "?"] == tokenize("Have I gone mad?")
    assert ["We're", "all", "mad", "here", "."] == tokenize("We're all mad here.")
    assert ["Imagination", "is", "the", "only", "weapon", "in", "the", "war", "against", "reality", "."] == tokenize("Imagination is the only weapon in the war against reality.")
  end
end
