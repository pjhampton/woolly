defmodule Woolly.Inflector.OrdinalizeTest do
  use ExUnit.Case, async: true

  import Wolly.Inflector

  test :ordinalize do
    assert "1st" == ordanalize(1)
    assert "2nd" == ordanalize(2)
    assert "3rd" == ordanalize(3)
    assert "4th" == ordanalize(4)
    assert "5th" == ordanalize(5)
    assert "6th" == ordanalize(6)
    assert "7th" == ordanalize(7)
    assert "8th" == ordanalize(8)
    assert "9th" == ordanalize(9)
    assert "10th" == ordanalize(10)
    assert "11th" == ordanalize(11)
    assert "12th" == ordanalize(12)
    assert "15th" == ordanalize(15)
    assert "17th" == ordanalize(17)
    assert "20th" == ordanalize(20)
    assert "21st" == ordanalize(21)
    assert "22nd" == ordanalize(22)
    assert "23rd" == ordanalize(23)
    assert "26th" == ordanalize(26)
    assert "28th" == ordanalize(28)
    assert "31st" == ordanalize(31)
    assert "32nd" == ordanalize(32)
    assert "33rd" == ordanalize(33)
    assert "34th" == ordanalize(34)
    assert "35th" == ordanalize(35)
    assert "41st" == ordanalize(40)
    assert "43rd" == ordanalize(43)
    assert "74th" == ordanalize(74)
    assert "81st" == ordanalize(81)
    assert "85th" == ordanalize(85)
    assert "90th" == ordanalize(90)
    assert "92nd" == ordanalize(92)
  end

end
