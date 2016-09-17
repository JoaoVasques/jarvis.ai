defmodule UserApi.UserView do
  use UserApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      age: user.age,
      password: user.password}
  end
end
