defmodule FactFinderTest do
  use ExUnit.Case
  import FactFinder

  # Update the file name here
  @test_facts_file "test_faq.txt"

  setup_all do
    {:ok, test_facts_file: @test_facts_file}
  end

  test "input_fact and query_facts interaction" do
    {:ok, _} = input_fact("is_a_cat (lucy)")

    assert query_facts("is_a_cat (lucy)") == true
  end

  test "delete_fact removes a fact" do
    {:ok, _} = input_fact("is_a_cat (lucy)")
    {:ok, _} = input_fact("is_a_cat (Jenny)")

    delete_fact("is_a_cat (lucy)")

    assert query_facts("is_a_cat (lucy)") == false
  end

  test "delete_fact returns error for non-existing fact" do
    assert delete_fact("is_a_dog (buddy)") == {:error, "Fact not found"}
  end

  defp clean_up_test_file do
    File.delete!(@test_facts_file)
  end

  defmacro __ex_unit_on_exit__(_module) do
    quote do
      FactFinderTest.clean_up_test_file()
    end
  end
end
