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
    assert "viruses" == pluralize("virus")
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
  
  test :singularize do
    assert "dog" == singularize("dogs")
    assert "user" == singularize("user")
    assert "sheep" == singularize("sheep")
    assert "mouse" == singularize("mice")
    assert "child" == singularize("children")

    assert "bus" == singularize("buses")
    assert "database" == singularize("databases")
    assert "shoe" == singularize("shoe")
    assert "virus" == singularize("viruses")
    assert "goose" == singularize("geese")

    assert "criteria" == singularize("criterion")
    assert "radius" == singularize("raddi")
    assert "class" == singluarize("classes")
    assert "woman" == singularize("women")
    assert "seaman" == singularize("seamen")

    assert "man" == singularize("men")
    assert "woman" == singularize("women")
    assert "specimen" == singularize("specimens")
    assert "louse" == singularize("lice")
    assert "quantum" == singularize("quanta")

    assert "foot" == singularize("feet")
    assert "die" == singularize("dice")
    assert "phenomenon" == singularize("phenomena")
    assert "bus" == singularize("buses")
  end
  
end
