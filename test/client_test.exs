
defmodule ClientTest do
  use ExUnit.Case
  doctest Pubmates

  test "get delivery quote" do
    response = Pubmates.Client.get_delivery_quote(System.get_env("TEST_CUSTOMER_ID"),  "20 McAllister St, San Francisco, CA", "101 Market St, San Francisco, CA")
    assert(Map.fetch!(response.body, "kind") == "delivery_quote")
  end


  test "get delivery zone" do
    response = Pubmates.Client.get_delivery_zones
    assert(response.status_code == 200)
  end

  test "delivery integration" do
    assert(true, "")
  end
end
