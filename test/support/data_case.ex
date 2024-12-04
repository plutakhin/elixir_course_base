defmodule Support.DataCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      require Assertions
      import Assertions, only: [assert_lists_equal: 2]
    end
  end
end
