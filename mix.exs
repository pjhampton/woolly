defmodule Woolly.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :woolly,
     name: "Woolly",
     version: @version,
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     docs: docs,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev}]
  end

  defp docs do
    [extras: [
      "info/CONTRIBUTING.md",
      "info/FAQs.md",
      "info/LICENSE.md",
      ],
      homepage_url: "http://github.com/pjhampton/woolly",
      source_url: "http://github.com/pjhampton/woolly",
      description: """
        Woolly is a text mining and natural language processing
        toolkit for the Elixir programming language.
      """]
  end
end
