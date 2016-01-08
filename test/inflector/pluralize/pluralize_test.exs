defmodule Woolly.Inflector.PluralizeTest do
  use ExUnit.Case, async: true

  import Woolly.Inflector

  test :pluralize do
    assert "dogs" == pluralize("dog")
    assert "users" == pluralize("user")
    assert "sheep" == pluralize("sheep")
    assert "mice" == pluralize("mouse")
    assert "children" == pluralize("child")

    assert "buses" == pluralize("bus")
    assert "databases" == pluralize("database")
    assert "shoes" == pluralize("shoe")
    assert "viri" == pluralize("virus")
    assert "geese" == pluralize("goose")

    assert "criteria" == pluralize("criterion")
    assert "radii" == pluralize("radius")
    assert "classes" == pluralize("class")
    assert "women" == pluralize("woman")
    assert "seamen" == pluralize("seamen")

    assert "men" == pluralize("men")
    assert "women" == pluralize("women")
    assert "specimens" == pluralize("specimen")
    assert "lice" == pluralize("louse")
    assert "quanta" == pluralize("quantum")

    assert "feet" == pluralize("foot")
    assert "dice" == pluralize("die")
    assert "phenomena" == pluralize("phenomenon")
    assert "buses" == pluralize(:bus)
  end
  
end
