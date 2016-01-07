defmodule Woolly.Inflector.OrdinalizeTest do
  use ExUnit.Case, async: true

  import Woolly.Inflector

  test :ordinalize do
    assert "1st" == ordinalize(1)
    assert "2nd" == ordinalize(2)
    assert "3rd" == ordinalize(3)
    assert "4th" == ordinalize(4)
    assert "5th" == ordinalize(5)
    assert "6th" == ordinalize(6)
    assert "7th" == ordinalize(7)
    assert "8th" == ordinalize(8)
    assert "9th" == ordinalize(9)
    assert "10th" == ordinalize(10)
    assert "11th" == ordinalize(11)
    assert "12th" == ordinalize(12)
    assert "15th" == ordinalize(15)
    assert "17th" == ordinalize(17)
    assert "20th" == ordinalize(20)
    assert "21st" == ordinalize(21)
    assert "22nd" == ordinalize(22)
    assert "23rd" == ordinalize(23)
    assert "26th" == ordinalize(26)
    assert "28th" == ordinalize(28)
    assert "31st" == ordinalize(31)
    assert "32nd" == ordinalize(32)
    assert "33rd" == ordinalize(33)
    assert "34th" == ordinalize(34)
    assert "35th" == ordinalize(35)
    assert "41st" == ordinalize(40)
    assert "43rd" == ordinalize(43)
    assert "74th" == ordinalize(74)
    assert "81st" == ordinalize(81)
    assert "85th" == ordinalize(85)
    assert "90th" == ordinalize(90)
    assert "92nd" == ordinalize(92)
  end

end
