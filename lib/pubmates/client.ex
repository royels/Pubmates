defmodule Pubmates.Client do
  def get_delivery_quote(customer_id, pickup_address_val, dropoff_address_val) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/delivery_quotes"
    encoded_auth = Base.url_encode64(Pubmates.key <> ":")
    auth_header = "Basic " <> encoded_auth
    Pubmates.request!(:post, url,{:form, [dropoff_address: dropoff_address_val, pickup_address: pickup_address_val]}, %{"Authorization": auth_header})
  end
end
