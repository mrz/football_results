#!/usr/bin/env sh

mix ecto.drop
mix ecto.create
mix ecto.migrate
mix run "priv/repo/seeds.exs"
