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
      package: package,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: cli_env_for(:test, [
        "coveralls", "coveralls.detail", "coveralls.post",
        "vcr", "vcr.delete", "vcr.check", "vcr.show"
      ]),
    ]
  end

  defp cli_env_for(env, tasks) do
    Enum.reduce(tasks, [], fn(key, acc) -> Keyword.put(acc, :"#{key}", env) end)
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:earmark,     "~> 0.1",   only: :dev },
      {:ex_doc,      "~> 0.11",  only: :dev },
      {:excoveralls, "~> 0.5",   only: :test},
      {:inch_ex,     "~> 0.5",   only: [:docs, :test]}
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
