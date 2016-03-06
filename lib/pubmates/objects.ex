defmodule DeliveryQuote do
  @derive [Poison.Encoder]
  defstruct [:pickup_address, :dropoff_address]
end


defmodule Delivery do
  @derive [Poison.Encoder]
  defstruct [:quote_id, :manifest, :manifest_reference, :pickup_name, :pickup_address,
  :pickup_phone_number, :pickup_business_name, :pickup_notes, :dropoff_name, :dropoff_address,
  :dropoff_phone_number, :dropoff_business_name, :dropoff_notes]
end

defmodule Tip do
  @derive [Poison.Encoder]
  defstruct [:tip_by_customer]
end

defmodule Empty do
  @derive [Poison.Encoder]
  defstruct []
end
