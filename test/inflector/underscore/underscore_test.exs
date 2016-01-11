defmodule Woolly.Inflector.UnderscoreTest do
  use ExUnit.Case, async: true

  import Woolly.Inflector

  test :underscore do
    assert "upper_camel_case" == underscore("UpperCamelCase")
    assert "lower_camel_case" == underscore("lowerCamelCase")
    assert "upper_camel_case" == underscore(UpperCamelCase)
    assert "lower_camel_case" == underscore(:lowerCamelCase)
    assert "hello_woolly" == underscore("hello-woolly")
    assert "go_go_woolly" == underscore("Go-go-Woolly")
    assert "go_go_woolly" == underscore("Go Go Woolly")
    assert "go_away_woolly" == underscore("Go Away Woolly")
  end

end
