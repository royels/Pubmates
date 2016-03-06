
defmodule PubmatesTest do
  use ExUnit.Case
  doctest Pubmates

  test "key" do
    assert(Pubmates.key == System.get_env("POSTMATES_API_KEY"), "Key is not set")
  end

  test "request works" do
    test_var = Pubmates.request!(:get, "https://api.github.com/users/royels")
    assert(Map.fetch!(test_var.body, "login") == "royels")
    assert(test_var.status_code == 200)
  end


end
