defmodule Interactors.FetchAllUsersInteractor do
  alias Gateways.User, as: UserGateway

  def call(), do: UserGateway.all()
end

