
defmodule ClientTest do
  use ExUnit.Case
  doctest Pubmates

  test "get delivery quote" do
    quote_response = Pubmates.Client.get_delivery_quote(System.get_env("TEST_CUSTOMER_ID"),  "20 McAllister St, San Francisco, CA", "101 Market St, San Francisco, CA")
    assert(Map.fetch!(quote_response.body, "kind") == "delivery_quote")
  end


  test "get delivery zone" do
    assert(true, "")

  end

  test "create a delivery" do
    assert(true, "")


  end


  test "list delivery" do
    assert(true, "")

  end


  test "get a delivery" do
    assert(true, "")


  end


  test "cancel delivery" do
    assert(true, "")


  end


  test "return delivery" do
    assert(true, "")

  end


  test "add tip" do
    assert(true, "")


  end

end
