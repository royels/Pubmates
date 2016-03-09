defmodule Pubmates do
  use Application
  use HTTPoison.Base

    
  @api_base "https://api.postmates.com/"
  @version_number  "v1/"


 # @expected_fields ~w(
 #   fee currency dropoff_eta duration expires

 #   properties features

 #   status complete pickup_eta 
 #   dropoff_deadline quote_id customer_signature_img_href
 #   manifest dropoff_identifier courier related_deliveries

 #   
 #   
 # )

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Pubmates.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pubmates.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
 #   |> Dict.take(@expected_fields)
 #   |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
 #  uncomment this and @expected fields to be able to access
 #  by atom instead. 
  end


  def base_api_host do
    @api_base
  end

  def customer_prefix do
    @version_number <> "customers/"
  end
  
  def key do
    System.get_env("POSTMATES_API_KEY")
  end

  def auth_header do
    encoded_auth = Base.url_encode64(Pubmates.key <> ":")
    %{"Authorization": "Basic " <> encoded_auth}
  end

end
