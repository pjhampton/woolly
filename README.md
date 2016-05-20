# Woolly

> ### Woolly ~ The Text Mining Elixir.
> Woolly is a Text Mining & Natural Language Processing API for the Elixir programming language. 

- Disclaimer: This is very early work and while some features work, others don't.

## Getting started

Woolly is [available in Hex](https://hex.pm/), install it by adding it to your project `mix.exs` file as so:

```elixir
def deps do
  [{:woolly, "~> 0.1.0"}]
end
```

If you're not using [Hex](http://hex.pm/), you can add it via this github repository:

```elixir
def deps do
  [{:woolly, github: "pjhampton/Woolly"}]
end
```

Make sure to start Woolly before your application as so: 

```elixir
def application do
  [applications: [:logger, :woolly]]
end
```

...and don't forget to run `mix deps.get` from the terminal to fetch and compile your workspace dependencies.

## Copyright & License

Copyright (c) 2016, PJ Hampton.

Woolly is released under the liberal <a href="http://pjhampton.mit-license.org/" target="_blank">MIT License</a>.

