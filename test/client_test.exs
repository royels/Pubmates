
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
    dropoff = %Dropoff{
      dropoff_name: "Pub Mates", 
      dropoff_address: "690 5th St, San Francisco, CA",
      dropoff_business_name: "Postmates", 
      dropoff_notes: "Just testing",
      dropoff_phone_number: "123-456-7890"
    }

    pickup = %Pickup{
      pickup_name: "Robo",
      pickup_address: "101 Market St, San Francisco, CA",
      pickup_business_name: "Geisel Library",
      pickup_phone_number: "123-456-7890",
      pickup_notes: "Ello"
    }

    created_response = Pubmates.Client.create_delivery(System.get_env("TEST_CUSTOMER_ID"), pickup, dropoff, "TEST TEST TEST")
    assert(created_response.status_code == 200)
    assert(Map.fetch!(created_response.body, "kind") == "delivery")
    delivery_id = Map.fetch!(created_response.body, "id")

    listed_response = Pubmates.Client.get_ongoing_deliveries(System.get_env("TEST_CUSTOMER_ID"))
    assert(listed_response.status_code == 200)

    specific_response = Pubmates.Client.get_specific_delivery(System.get_env("TEST_CUSTOMER_ID"), delivery_id)
    assert(specific_response.status_code == 200)
    assert(Map.fetch!(specific_response.body, "kind") == "delivery")

    
    tipped_response = Pubmates.Client.add_tip_to_delivery(System.get_env("TEST_CUSTOMER_ID"), delivery_id, 1000)
    assert(tipped_response.status_code == 400) # Because delivery has already been "completed"

  end
end
