defmodule Gateways.User do
  alias UserApi.Repo
  alias UserApi.UserModel
  import Ecto.Query

  def all(), do: Repo.all(UserModel)
  def insert(user), do: Repo.insert(user)
  def get(id), do: Repo.get_by(UserModel, id: id)
  def delete(user), do: Repo.delete(user)
end

