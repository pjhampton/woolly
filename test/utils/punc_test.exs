defmodule Woolly.Utils.PunctuationTest do
  use ExUnit.Case, async: true

  import Woolly.Utils.Punctuation

  test :strip_punctuation do
    assert remove_punctuation(["My", "name", "is", "Woolly", "!"]) === ["My", "name", "is", "Woolly"]
    assert remove_punctuation(["How", "are", "you", "?"]) == ["How", "are", "you"]
    assert remove_punctuation(["this", "is", "a", "test", ";"]) == ["this", "is", "a", "test"]
  end
end
