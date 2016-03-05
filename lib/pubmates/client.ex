defmodule Pubmates.Client do
  def get_delivery_quote(customer_id, pickup_address, dropoff_address) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/delivery_quotes"
  end
end
