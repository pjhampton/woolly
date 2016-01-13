defmodule Woolly.Stemmer.RestemmerTest do
  use ExUnit.Case, async: true

  import Woolly.Stemmer.Restemmer

  setup_all do
    {:ok, [pattern: ~r/ing$|s$|e$|able$|ial$/]}
  end

  test :regex_stemmer, %{pattern: pattern} do
    assert "car" == stem("cars", pattern)
    assert "dog" == stem("dogs", pattern)
    assert "was" == stem("was", pattern)
    assert "driv" == stem("drivable", pattern)
    assert "lov" == stem("loving", pattern)
    assert "semantic" == stem("semantic", pattern)
    assert "process" == stem("processing", pattern)
    assert "wool" == stem("woolly", pattern)
    assert "emacs" == stem("emacs", pattern)
    assert "linguitic" == stem("linguistics", pattern)
    assert "informat" == stem("information", pattern)
    assert "system" == stem("system", pattern)
    assert "Systems" == stem("Systems", pattern)
    assert "combinator" == stem("cominatorial", pattern)
    assert "person" == stem("persons", pattern)
    assert "Twitter" == stem("Twitter", pattern)
    assert "clojure" == stem("clojure", pattern)
    assert "foundat" == stem("foundation", pattern)
  end
end
