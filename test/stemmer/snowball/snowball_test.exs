defmodule Woolly.Stemmer.SnowballTest do
  use ExUnit.Case, async: true

  import Woolly.Stemmer.Snowball

  # The ground truths for these tests were generated
  # using the Python nltk - `nltk.stem.snowball`

  test :snowball_stemmer do
    assert "caress" = stem("caresses")
    assert "fli" = stem("flies")
    assert "die" = stem("dies")
    assert "mule" = stem("mules")
    assert "deni" = stem("denied")
    assert "agre" = stem("agreed")
    assert "own" = stem("owned")
    assert "humbl" = stem("humbled")
    assert "size" = stem("sized")
    assert "meet" = stem("meeting")
    assert "state" = stem("stating")
    assert "sensat" = stem("sensational")
    assert "tradit" = stem("traditional")
    assert "refer" = stem("reference")
    assert "plot" = stem("plotted")
    assert "discret" = stem("discrete")
    assert "languag" = stem("language")
    assert "love" = stem("love")
    assert "hope" = stem("hope")
    assert "Elixir" = stem("Elixir")
    assert "HampTON" = stem("HampTON")
    assert "Winni" = stem("Winnie")
    assert "dog" = stem("dog")
    assert "westi" = stem("westie")
    assert "comput" = stem("computer")
    assert "TwiTTer" = stem("TwiTTer")
    assert "Generous" = stem("Generous")
  end
end
