defmodule Woolly.Utils.XMLTest do
  use ExUnit.Case, async: true

  import Woolly.Utils.XML

  test :removing_xml do
    assert "my name is woolly" === remove_xml("my name is <name>woolly</name>")
    assert "" === remove_xml("<!doctype html><html><head></head><body></body></html>")
    assert "I love you" === remove_xml("<positive>I love you</positive>")
    assert "I hate you" === remove_xml("<negative score='3'>I hate you</negative>")
    assert "Peter" === remove_xml("<name>Peter</name>")
    assert "2 + 2 = 99" === remove_xml("<num>2</num> <op>+</op> <num>2</num> <op>=</op> <num>99</num>")
  end
end
