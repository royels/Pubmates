defmodule Pubmates.Client do

  def get_delivery_quote(customer_id, pickup_address_val, dropoff_address_val) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/delivery_quotes"
    Pubmates.request!(:post, url,{:form, [dropoff_address: dropoff_address_val, pickup_address: pickup_address_val]}, Pubmates.auth_header)
  end


  def get_delivery_zones do
    url = Pubmates.base_api_host <> "v1/delivery_zones"
    Pubmates.request!(:get, url, "", Pubmates.auth_header)
  end


  def create_delivery(customer_id, pickup_object, dropoff_object, manifest, manifest_reference \\ "", quote_id \\ "") do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/deliveries" 
    pickup = Map.to_list(pickup_object)
    dropoff = Map.to_list(dropoff_object)
    final = pickup ++ dropoff ++ [manifest: manifest, manifest_reference: manifest_reference, quote_id: quote_id]
    Pubmates.request!(:post, url, {:form, final} , Pubmates.auth_header)
  end


  def get_ongoing_deliveries(customer_id) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/deliveries"
    Pubmates.request!(:get, url,{:form, [filter: "ongoing"]}, Pubmates.auth_header)
  end

  def get_specific_delivery(customer_id, delivery_id) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/deliveries/" <> delivery_id
    Pubmates.request!(:get, url, [], Pubmates.auth_header)
  end
  
  def cancel_delivery(customer_id, delivery_id) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/deliveries/" <> delivery_id <> "/cancel"
    Pubmates.request!(:post, url, [], Pubmates.auth_header)
  end
 

  def return_delivery(customer_id, delivery_id) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/deliveries/" <> delivery_id <> "/return"
    Pubmates.request!(:post, url, [], Pubmates.auth_header)
  end

  def add_tip_to_delivery(customer_id, delivery_id, tip) do
    url = Pubmates.base_api_host <> Pubmates.customer_prefix <> customer_id <> "/deliveries/" <> delivery_id
    Pubmates.request!(:post, url, {:form, [tip_by_customer: tip]}, Pubmates.auth_header)
  end

end
