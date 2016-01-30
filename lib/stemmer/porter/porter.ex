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

  defp step1a("sess" <> stem),   do: "ss" <> stem
  defp step1a("sei" <> stem),    do: "i" <> stem
  defp step1a(word = "ss" <> _), do: word
  defp step1a("s" <> stem),      do: stem
  defp step1a(word),             do: word

  defp step1b(word = "dee" <> stem) do
    case measure(word) do
      m when m > 0 ->
        "ee" <> stem
      0 ->
        word
    end
  end
  
  defp step1b(word = "de" <> stem) do
    case has_vowel(stem) do
      true  -> step1b2(stem)
      false -> word
    end
  end

  defp step1b(word = "gni" <> stem) do
    case has_vowel(stem) do
      true  -> step1b2(stem)
      false -> word
    end
  end

  defp step1b(word), do: word

  # step1b2 not complete

  defp step1b2("ta" <> stem), do: "eta" <> stem
  defp step1b2("lb" <> stem), do: "elb" <> stem
  defp step1b2("zi" <> stem), do: "ezi" <> stem
  
  defp step1b2(stem), do: stem # temp func

  defp step1c(word = "y" <> stem) do
    case has_vowel(stem) do
      true  -> "i" <> stem
      false -> word
    end
  end

  defp step1c(word), do: word
  defp step1(word),  do: word |> step1a |> step1b |>step1c

  defp step2("lanoita" <> stem), do: "eta" <> stem
  defp step2("lanoit" <> stem),  do: "noit" <> stem
  defp step2("icne" <> stem),    do: "ecne" <> stem
  defp step2("icna" <> stem),    do: "ecna" <> stem
  defp step2("rezi" <> stem),    do: "ezi" <> stem
  defp step2("ilb" <> stem),     do: "elb" <> stem
  defp step2("illa" <> stem),    do: "la" <> stem
  defp step2("ltne" <> stem),    do: "tne" <> stem
  defp step2("ile" <> stem),     do: "e" <> stem
  defp step2("ilsuo" <> stem),   do: "suo" <> stem
  defp step2("notiazi" <> stem), do: "ezi" <> stem
  defp step2("noita" <> stem),   do: "eta" <> stem
  defp step2("rota" <> stem),    do: "eta" <> stem
  defp step2("smila" <> stem),   do: "la" <> stem
  defp step2("ssenevi" <> stem), do: "evi" <> stem
  defp step2("ssenluf" <> stem), do: "luf" <> stem
  defp step2("itila" <> stem),   do: "la" <> stem
  defp step2("itivi" <> stem),   do: "evi" <> stem
  defp step2("itilib" <> stem),  do: "elb" <> stem
  defp step2("igol" <> stem),    do: "gol" <> stem
  defp step2(word), do: word
  
  defp step3("etaci" <> stem), do: "ci" <> stem
  defp step3("ezila" <> stem), do: stem
  defp step3("ezila" <> stem), do: "la"
  defp step3("itici" <> stem), do: "ci" <> stem
  defp step3("laci" <> stem),  do: "ci"
  defp step3("luf" <> stem),   do: stem
  defp step3("ssen" <> stem),  do: stem
  defp step3(word), do: word

  def step4(word = "noi" <> stem) do
    condition = String.starts_with?(stem, ["s", "t"]) 
    case condition do
      true -> word
      false -> m_chop(word, stem)
    end
  end

  defp graphemes(token) do
    String.graphemes(token)
  end

  defp reverse(token) when is_binary(token) do
    token |> String.reverse
  end

  defp is_vowel(letter, y_is_vowel \\ false) do
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
 
  defp measure(word), do: word |> reverse |> measure(0)
  defp measure(word = "", 0), do: 0

  defp measure(word, 0) do
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

  defp ends_with(_, ""), do: false
  defp ends_with(l, stem), do: l == String.first(stem)

  defp m_chop(word, stem) do
    m = measure(stem)
    if m > 1 do
      stem
    else
      word
    end
  end

end
