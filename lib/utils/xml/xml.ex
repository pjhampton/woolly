defmodule Woolly.Utils.XML do
  @moduledoc ~S"""
  XML Utilities.

  This module provides utilities to analyze and work
  with XML (eXtensible Markup Language) documents in
  a conveinant way. 
  """

  @doc """
  Removes any and all XML from an inputted document.
  This is a preprocessing function for conveinance 
  when the XML is not needed nor wanted in the 
  analysis of the document. 

      iex> doc = "My name is <strong>Woolly</strong>."
      iex> remove_xml(doc)
      "my name is Woolly."

      iex> doc = "<!doctype html><html><h1>Hello</h1></html>"
      iex> remove_xml(doc)
      "Hello"
  """
  def remove_xml(document) do
    Regex.replace(~r/<.*?>/, document, "")
  end
end
