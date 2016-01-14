defmodule Woolly.Stemmer.LancasterTest do
  use ExUnit.Case, async: true

  import Woolly.Stemmer.Lancaster

  # The ground truths for these tests were generated
  # using the Python nltk - `nltk.stem.lancaster`

  test :lancaster_stemmer do
    assert "caress" = stem("caresses")
    assert "fli" = stem("flies")
    assert "die" = stem("dies")
    assert "mul" = stem("mules")
    assert "deny" = stem("denied")
    assert "agree" = stem("agreed")
    assert "own" = stem("owned")
    assert "humbl" = stem("humbled")
    assert "siz" = stem("sized")
    assert "meet" = stem("meeting")
    assert "stat" = stem("stating")
    assert "sens" = stem("sensational")
    assert "tradit" = stem("traditional")
    assert "ref" = stem("reference")
    assert "plot" = stem("plotted")
    assert "discreet" = stem("discrete")
    assert "langu" = stem("language")
    assert "lov" = stem("love")
    assert "hop" = stem("hope")
    assert "Elixir" = stem("Elixir")
    assert "HampTON" = stem("HampTON")
    assert "Winny" = stem("Winnie")
    assert "dog" = stem("dog")
    assert "westy" = stem("westie")
    assert "comput" = stem("computer")
    assert "TwiT" = stem("TwiTTer")
    assert "Gen" = stem("Generous")
  end
end
