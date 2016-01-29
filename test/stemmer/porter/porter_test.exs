defmodule Woolly.Stemmer.PorterTest do
  use ExUnit.Case, async: true

  import Woolly.Stemmer.Porter

  # The ground truths for these tests were generated
  # using the Python nltk - `nltk.stem.porter`

  test :porter_stemmer do
    assert "caress" = stem("caresses")
    assert "fli" = stem("flies")
    assert "di" = stem("dies")
    assert "mule" = stem("mules")
    assert "deni" = stem("denied")
    assert "agre" = stem("agreed")
    assert "own" = stem("owned")
    assert "humbl" = stem("humbled")
    assert "size" = stem("sized")
    assert "meet" = stem("meeting")
    assert "cat" = stem("cats")
    assert "state" = stem("stating")
    assert "sensat" = stem("sensational")
    assert "tradit" = stem("traditional")
    assert "refer" = stem("reference")
    assert "plot" = stem("plotted")
    assert "discret" = stem("discrete")
    assert "languag" = stem("language")
    assert "feed" = stem("feed")
    assert "disable" = stem("disabled")
    assert "mat" = stem("matting")
    assert "mate" = stem("mating")
    assert "love" = stem("love")
    assert "hope" = stem("hope")
    assert "Elixir" = stem("Elixir")
    assert "HampTON" = stem("HampTON")
    assert "Winni" = stem("Winnie")
    assert "dog" = stem("dog")
    assert "westi" = stem("westie")
    assert "comput" = stem("computer")
    assert "TwiTTer" = stem("TwiTTer")
    assert "Gener" = stem("Generous")
  end
end
