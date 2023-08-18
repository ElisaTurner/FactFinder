defmodule FactFinder do
  @moduledoc """
  This module stores and manages the facts that are input by the user.
  """

  @facts_file "facts.txt"
  # Function to input a new fact
  def input_fact(statement) do
    downcased_statement = String.downcase(String.trim(statement))
    updated_facts = read_facts() ++ [downcased_statement]
    write_facts(updated_facts)
    IO.puts("Input Fact: #{downcased_statement}")
    updated_facts
  end

  # Function to query for a fact
  def query_facts(statement) do
    downcased_statement = String.downcase(String.trim(statement))
    stored_facts = read_facts()

    IO.puts("Query Fact (Input): #{downcased_statement}")

    case Enum.member?(stored_facts, downcased_statement) do
      true ->
        IO.puts("---")
        IO.puts(true)

      false ->
        IO.puts("---")
        IO.puts(false)
    end

    :ok
  end

  # Internal function to read facts from the file
  defp read_facts() do
    case File.read(@facts_file) do
      {:ok, content} ->
        String.split(content, "\n")

      _ ->
        []
    end
  end

  # Internal function to write facts to the file
  defp write_facts(facts) do
    File.write!(@facts_file, Enum.join(facts, "\n"))
  end

  def delete_fact(statement) do
    downcased_statement = String.downcase(String.trim(statement))
    stored_facts = read_facts()

    case Enum.member?(stored_facts, downcased_statement) do
      true ->
        updated_facts = List.delete(stored_facts, downcased_statement)
        write_facts(updated_facts)
        IO.puts("Deleted Fact: #{downcased_statement}")
        {:ok, updated_facts}

      false ->
        IO.puts("Fact not found for deletion.")
        {:error, "Fact not found"}
    end
  end
end
