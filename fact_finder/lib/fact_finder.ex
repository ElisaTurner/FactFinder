defmodule FactFinder do
  @moduledoc """
  Documentation for `FactFinder`.
  """

  @doc """
  This module manages facts. It defines functions to handle the user input and various queries. 

  ## Examples

      iex> FactFinder.fact_finder()


  """
  defmodule fact_finder do
    def run(file_path) do
      file = File.open!(file_path, [:read])
      process_lines(file)
      File.close(file)
    end
  end
end
