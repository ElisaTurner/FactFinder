defmodule FactFinderTest do
  use ExUnit.Case
  doctest FactFinder

  test "greets the world" do
    assert FactFinder.hello() == :world
  end
end
