defmodule Woolly.Utils.Profanity do
  @moduledoc """
  A module for analyzing, removing and replacing profanity
  within a tokenized list of words.
  """

  @doc """
  Removes stopwords from a list of words.

  # Parameters

    - sent: A tokenized list of words.
    - lang: An atom representing a language iso 639-1 code.
  """
  def remove_profanity(sent, lang \\ :en) do
    profanity = fetch_profanity(lang)
    sent |> Enum.reject(fn(x) -> x in profanity end)
  end

  @doc """
  Replaces profanity within a tokenized list of words.

  # Parameters

    - sent: A tokenized list of words.
    - replacer: The String to replace the offending word.
    - lang: An atom representing a language iso 639-1 code.
  """
  def replace_profanity(sent, replacer \\ "", lang \\ :en) do
    profanity = fetch_profanity(lang)
    sent |> Enum.map(fn(x) ->
      if Enum.member?(profanity, x) do replacer else x end
    end)
  end
  
  @doc """
  The list_profanity function lists all of the profanity
  for a specified language. 

  ## Parameters
 
    - lang: An atom representing a language iso 639-1 code.
  """
  def list_profanity(lang \\ :en) do
    lang |> fetch_profanity
  end

  defp fetch_profanity(lang) do
    folder_path = "resources/corpora/profanity/"
    file_path = Atom.to_string(lang) <> ".profanity"
    path = folder_path <> file_path
    {:ok, profanity} = File.read(path)
    Regex.split(~r/\n/, profanity)
  end
end
