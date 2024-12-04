defmodule PatternMatchTest do
  @moduledoc false
  use Support.DataCase

  test "first_of_list function returns the first element of a list" do
    assert PatternMatch.first_of_list([1, 2, 3]) == 1
    assert PatternMatch.first_of_list(["a", "b", "c"]) == "a"
  end

  test "company_name function returns the correct company name" do
    assert PatternMatch.company_name("google_drive") == "ООО «Гугл»"
    assert PatternMatch.company_name("yandex_direct") == "ООО «Яндекс»"
    assert PatternMatch.company_name("yandex_disk") == "ООО «Яндекс»"
    assert PatternMatch.company_name("yandex_drive") == "ООО «Яндекс»"
  end

  test "all_options_exists? function returns correct boolean value" do
    assert PatternMatch.all_options_exists?({:a, :b, :c, :d}) == true
    assert PatternMatch.all_options_exists?({:a, :b, :c}) == true
    assert PatternMatch.all_options_exists?({:a, :b}) == false
    assert PatternMatch.all_options_exists?({:a}) == false
    assert PatternMatch.all_options_exists?({}) == false
  end

  test "get_id! function raises an exception if id is not found" do
    assert_raise FunctionClauseError, fn ->
      PatternMatch.get_id!(%{})
    end

    assert_raise FunctionClauseError, fn ->
      # key not atom
      PatternMatch.get_id!(%{"id" => 10})
    end

    assert PatternMatch.get_id!(%{id: nil}) == nil
    assert PatternMatch.get_id!(%{id: 10}) == 10
    assert PatternMatch.get_id!(%{id: 12}) == 12
  end

  test "record_persist? function returns correct boolean value" do
    assert PatternMatch.record_persist?(%{id: 1}) == true
    assert PatternMatch.record_persist?(%{id: nil}) == false
  end
end
