defmodule Dropoff do
  defstruct [:dropoff_name, :dropoff_address, :dropoff_phone_number, 
  :dropoff_business_name, :dropoff_notes]
end

defmodule Pickup do
  defstruct [:pickup_name, :pickup_address, :pickup_phone_number, 
  :pickup_business_name, :pickup_notes]
end
