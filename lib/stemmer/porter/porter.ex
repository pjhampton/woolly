defmodule Woolly.Stemmer.Porter do
  @moduledoc ~S"""
  The Porter Stemming Algorithm

  This is the Porter stemming algorihm, ported to
  the elixir programming language from the ANSI C
  verion by Martin Porter, the original author of
  this algorithm and the paper describing it -

  > Porter, M. "An algorithm for suffix stripping."
  > Program 14.3 (1980): 130-137.

  A stemming algorithm is a morphological tool for
  reducing a word to their word stem, base or root
  form. They have been a popular feature when text
  mining or natural language processing, retrieval
  systems in particular. 

  If you implement `Woolly.Stemmer.Porter`, please
  consider crediting the above paper and Woolly...
  """

  @irregular_forms [
    {~r/skies/i, "sky"},
    {~r/sky/i, "sky"},
    {~r/dying/i, "die"},
    {~r/lying/i, "lie"},
    {~r/tying/i, "tie"},
    {~r/news/i, "news"},
    {~r/inning(s?)/i, "inning"},
    {~r/outing(s?)/i, "outing"},
    {~r/canning(s?)/i, "canning"},
    {~r/howe/i, "howe"},
    {~r/proceed/i, "proceed"},
    {~r/exceed/i, "exceed"},
    {~r/succeed/i, "succeed"},
  ]

  @doc """
  stem/1

  Stems a token using the Porter Stemming algorithm

  """
  def stem(word) when byte_size(word) > 2 do
    word
    |> reverse
    |> step1
    |> step2
    |> step3
    |> reverse
    # |> step4 |> step5
  end

  def stem(word), do: word

  ##################################################
  ##################################################
  ##
  ## Steps
  ##
  ##################################################
  ##################################################

  # Step1a ~ complete
  def step1a("sess" <> stem),   do: "ss" <> stem
  def step1a("sei" <> stem),    do: "i" <> stem
  def step1a(word = "ss" <> _), do: word
  def step1a("s" <> stem),      do: stem
  def step1a(word),             do: word

  # Step1b ~ incomplete

  def step1b(word = "dee" <> stem) do
    case measure(word) do
      m when m > 0 ->
        "ee" <> stem
      0 ->
        word
    end
  end
  
  def step1b(word = "de" <> stem) do
    case has_vowel(stem) do
      true  -> step1b2(stem)
      false -> word
    end
  end

  def step1b(word = "gni" <> stem) do
    case has_vowel(stem) do
      true  -> step1b2(stem)
      false -> word
    end
  end

  def step1b(word), do: word

  def step1b2("ta" <> stem), do: "eta" <> stem
  def step1b2("lb" <> stem), do: "elb" <> stem
  def step1b2("zi" <> stem), do: "ezi" <> stem
  
  def step1b2(stem), do: stem # temp func


  #####
  ##### Step1c
  #####

  def step1c(word = "y" <> stem) do
    case has_vowel(stem) do
      true  -> "i" <> stem
      false -> word
    end
  end

  def step1c(word), do: word

  def step1(word), do: word |> step1a |> step1b |>step1c

  ####
  #### Step2
  ####
  #### icna -> ecna
  #### rezi -> ezi
  #### ilb -> elb
  #### illa -> la
  #### iltne -> tne
  #### ile -> e
  #### ilsuo -> suo
  #### noitazi -> ezi
  #### noita -> eta
  #### rota ->. eta
  #### msila -> la
  #### ssenevi -> evi
  #### ssenluf -> luf
  #### itila -> la
  #### itivi -> evi
  #### itilib -> elb
  #### igol -> gol

  def step2("lanoita" <> stem), do "eta" <> stem
  def step2("lanoit" <> stem), do: "noit" <> stem
  def step2("icne" <> stem), do: "ecne" <> stem
  def step2(word), do: word
  
  ####
  #### Step 3
  ####
  #### etaci -> ci
  #### evita -> ""
  #### ezila -> la
  #### itici -> ci
  #### laci -> ci
  #### luf -> ""
  #### ssen -> ""

  def step3(word), do: word

  ##################################################
  ##################################################
  ##
  ## Conveinance Functions
  ##
  ##################################################
  ##################################################

  defp graphemes(token) do
    String.graphemes(token)
  end

  defp reverse(token) when is_binary(token) do
    token |> String.reverse
  end

  
  def is_vowel(letter, y_is_vowel \\ false) do
    case letter do
      "a"                 -> true
      "e"                 -> true
      "i"                 -> true
      "o"                 -> true
      "u"                 -> true
      "y" when y_is_vowel -> true
      _                   -> false
    end
  end
 
  def measure(word), do: word |> reverse |> measure(0)
  def measure(word = "", 0), do: 0

  def measure(word, 0) do
    head = String.first(word)
    tail = String.slice(word, 1..-1)

    case is_vowel(head) do
      true  -> found_vowel(tail, 0)
      false -> found_leading_consonant(tail)
    end
  end

  defp found_leading_consonant(word = ""), do: 0

  defp found_leading_consonant(word) do
    head = String.first(word)
    tail = String.slice(word, 1..-1)
    case is_vowel(head, false) do
      true  -> found_vowel(tail, 0)
      false -> found_leading_consonant(tail)
    end
  end

  defp found_vowel(word = "", m), do: m

  defp found_vowel(word, m) do
    head = String.first(word)
    tail = String.slice(word, 1..-1)

    case is_vowel(head, false) do
      true -> found_vowel(tail, m)
      false -> found_consonant(tail, m + 1)
    end
  end

  defp found_consonant(word = "", m), do: 0

  defp found_consonant(word, m) do
    head = String.first(word)
    tail = String.slice(word, 1..-1)

    case is_vowel(head, true) do
      true  -> found_vowel(tail, m)
      false -> found_consonant(tail, m)
    end
  end

  defp has_vowel(word), do: word |> has_vowel1

  defp has_vowel1(word = ""), do: false

  defp has_vowel1(word) do
    head = String.first(word)
    tail = String.slice(word, 1..-1)

    case is_vowel(head, false) do
      true  -> true
      false -> has_vowel2(tail)
    end
  end

  defp has_vowel2(word = ""), do: false

  defp has_vowel2(word) do
    head = String.first(word)
    tail = String.slice(word, 1..-1)

    case is_vowel(head, true) do
      true  -> true
      false -> has_vowel2(tail)
    end
  end

  def ends_with(_, ""), do: false
  def ends_with(l, stem), do: l == String.first(stem)

  def ends_with_cvc
end
