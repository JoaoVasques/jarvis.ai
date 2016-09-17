defmodule UserApi.IntegrationTest do
  use UserApi.ModelCase

  alias UserApi.Integration

  @valid_attrs %{active: true, name: "some content", system: "some content", token: 42, unique_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Integration.changeset(%Integration{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Integration.changeset(%Integration{}, @invalid_attrs)
    refute changeset.valid?
  end
end
