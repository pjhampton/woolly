defmodule Woolly.Utils.Stopwords do
  @moduledoc ~S"""
  A module for removing stopwords.

  Stopwords are common to very common words usually
  found in every sentence. Examples in the english
  language include 'the', 'a', 'how'. Some analysts
  remove stopwords to improve their systems in some
  sense, such as accuracy or algorighm performance.

  Woolly provides the following conveinance module
  to remove stopwords in the languages below which
  correspond to their ISO 639-1 code. A full list
  of the codes can be found on this Wikipedia list.

  https://wikipedia.org/wiki/List_of_ISO_639-1_codes

  The public functions include:

  `remove_stopwords/1`
  `remove_stopwords/2`
  `list_stopwords/1`
  `list_stopwords/2`

  If no language is selected as a parameter, then
  the Woolly.Utils (Utilities) will return english.
  """

  @doc ~S"""
  Removes stopwords from a list of words.

  # Parameters

    - `sent` - (list) a tokenized list of words.
    - `lang` - (atom) the language iso 639-1 code.
  """
  def remove_stopwords(sent, lang \\ :en) do
    stopwords = fetch_stopwords(lang)
    sent
    |> Enum.reject(fn(x) -> x in stopwords end)
  end

  @doc ~S"""
  Lists stopwords available in the corpus.

  # Parameters

    - `lang` - (atom) the language iso 639-1 code.
  """
  def list_stopwords(lang \\ :en) do
    fetch_stopwords(lang)
  end

  @doc ~S"""
  Fetches the list of stop words from the corpora.

  # Parameters

    - `lang` - (atom) the language iso 639-1 code.
  """
  defp fetch_stopwords(lang) do
    folder_path = "resources/corpora/stopwords/"
    file_path = Atom.to_string(lang) <> ".stopwords"
    path = folder_path <> file_path
    {:ok, stopwords} = File.read(path)
    Regex.split(~r/\n/, stopwords)
  end
end
