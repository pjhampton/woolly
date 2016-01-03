defmodule Woolly.Inflector.ParameterizeTest do
  use ExUnit.Case, async: true

  import Woolly.Inflector

  test :parameterize do
    assert "woolly-inflector" == parameterize("woolly inflector")
    assert "text-mining" == parameterize("text mining")
    assert "text_mining" == parameterize("text mining", "_")
    assert "woolly" == parameterize("woolly")
    assert "pj-hampton" == parameterize("pj hampton")
    assert "the-hobbit" == parameterize("the hobbit")
  end

end
