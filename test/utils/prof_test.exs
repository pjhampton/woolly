defmodule Woolly.Utils.ProfanityTest do
  use ExUnit.Case, async: true

  import Woolly.Utils.Profanity

  test :remove_profanity do
    
    bad_words1 = ["shit", "m0therfucker", "b00bs", "sh1t"]
    bad_words2 = ["hello", "love", "fuck", "ass", "a_s_s"]
    bad_words3 = ["bitch", "ass", "tits", "dick", "cat"]
    bad_words4 = ["i", "fucking", "hate", "swearing"]
    
    assert remove_profanity(bad_words1) == []
    assert remove_profanity(bad_words2) == ["hello", "love"]
    assert remove_profanity(bad_words3) == ["cat"]
    assert remove_profanity(bad_words4) == ["i", "hate", "swearing"]
  end
end
