defmodule Interactors.FindUserInteractor do
  alias Gateways.User, as: UserGateway
  
  def call(id), do: UserGateway.get(id)
end

