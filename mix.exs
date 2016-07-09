defmodule Woolly.Mixfile do
  use Mix.Project

  @version "0.1.2"
  @description """
    Woolly is the text mining and natural language toolkit for the Elixir programming language.
  """

  def project do
    [
      app: :woolly,
      name: "Woolly",
      version: @version,
      description: @description,
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      docs: docs,
      deps: deps,
      package: package
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:earmark, "~> 0.1", only: :dev },
      {:ex_doc, "~> 0.11", only: :dev },
      {:inch_ex,           only: [:docs, :test]}
    ]
  end

  defp docs do
    [
      homepage_url: "http://github.com/pjhampton/Woolly",
      source_url: "http://github.com/pjhampton/Woolly",
    ]
  end

  defp package do
    [
      maintainers: ["PJ Hampton"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/pjhampton/Woolly"},
      files: ~w( lib priv test mix.exs README.md )
    ] 
  end
end
