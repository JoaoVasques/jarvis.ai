defmodule Interactors.DeleteUserInteractor do
  alias Gateways.User, as: UserGateway
  
  def call(user), do: UserGateway.delete(user)
end

