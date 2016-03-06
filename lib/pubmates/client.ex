defmodule Pubmates.Client do

  def get_delivery_quote(customer_id, pickup_address_val, dropoff_address_val) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/delivery_quotes"
    Pubmates.request!(:post, url,{:form, [dropoff_address: dropoff_address_val, pickup_address: pickup_address_val]}, %{"Authorization": Pubmates.auth_header})
  end


  def get_delivery_zones do
    url = Pubmates.base_api_host <> "v1/delivery_zones"
    Pubmates.request!(:get, url, "", %{"Authorization": Pubmates.auth_header})
  end



end
