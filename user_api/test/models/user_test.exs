defmodule UserApi.UserTest do
  use UserApi.ModelCase

  alias UserApi.User

  @valid_attrs %{age: 42, email: "some content", first_name: "some content", last_name: "some content", password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
