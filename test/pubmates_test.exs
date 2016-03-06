
defmodule PubmatesTest do
  use ExUnit.Case
  doctest Pubmates

  test "key" do
    assert(Pubmates.key == System.get_env("POSTMATES_API_KEY"), "Key is not set")
  end

  test "request get" do
    test_var = Pubmates.request!(:get, "https://api.github.com/users/royels", "{\"foo\": 3}", [{"Accept", "application/json"}]).body
    assert(Map.fetch!(test_var, "login") == "royels", "Bad parameters")
  end

end
