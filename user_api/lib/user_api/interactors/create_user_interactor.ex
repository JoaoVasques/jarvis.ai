defmodule Interactors.CreateUserInteractor do
  alias Gateways.User, as: UserGateway
  
  def call(user), do: UserGateway.insert(user)
end

