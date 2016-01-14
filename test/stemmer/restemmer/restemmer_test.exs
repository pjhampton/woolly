defmodule Woolly.Stemmer.RestemmerTest do
  use ExUnit.Case, async: true

  import Woolly.Stemmer.Restemmer

  setup_all do
    {:ok, [pattern: ~r/ing$|s$|e$|es$|able$|ial$|ly$|ion$/]}
  end

  test :regex_stemmer, %{pattern: pattern} do
    assert "car" == stem("cars", pattern)
    assert "dog" == stem("dogs", pattern)
    assert "wa" == stem("was", pattern)
    assert "driv" == stem("drivable", pattern)
    assert "lov" == stem("loving", pattern)
    assert "semantic" == stem("semantic", pattern)
    assert "process" == stem("processing", pattern, 3)
    assert "wool" == stem("woolly", pattern)
    assert "emac" == stem("emacs", pattern)
    assert "linguistic" == stem("linguistics", pattern)
    assert "informat" == stem("information", pattern)
    assert "system" == stem("system", pattern)
    assert "System" == stem("Systems", pattern)
    assert "combinator" == stem("combinatorial", pattern)
    assert "person" == stem("persons", pattern)
    assert "Twitter" == stem("Twitter", pattern)
    assert "clojur" == stem("clojure", pattern, 4)
    assert "foundat" == stem("foundation", pattern)
    assert "processing" == stem("processing", pattern, 11)
  end
end
