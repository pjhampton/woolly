defmodule Woolly.Utils.Punctuation do
  @moduledoc ~S"""
  
  Punctuation Remover

  A module that removes punctuation from a sentence.
  """

  def remove_punctuation(sent) do
    punctuation = ~w{" ' ( ) [ ] : ; , . - ... ! ? |}
    sent |> Enum.reject(fn(x) -> x in punctuation end)
  end
end
