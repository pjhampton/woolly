defmodule Woolly.Inflector.CamelizeTest do
  use ExUnit.Case, async: true

  import Woolly.Inflector

  test :camelize_upper do
    assert "AlphaBetaCharlie" == camelize("Alpha-Beta-Charlie", :upper)
    assert "ElixirLang" == camelize("elixir lang")
    assert "MyFairLady" == camelize("My Fair Lady")
    assert "TextMining" == camelize("Text mining")
  end

  test :camelize_lower do
    assert "alphaBetaCharlie" == camelize("Alpha Beta Charlie", :lower)
    assert "elixirLang" == camelize("elixir lang", :lower)
    assert "myFairLady" == camelize("My Fair Lady", :lower)
    assert "textMining" == camelize("Text mining", :lower)
  end

end
