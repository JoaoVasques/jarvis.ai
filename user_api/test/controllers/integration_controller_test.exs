defmodule UserApi.IntegrationControllerTest do
  use UserApi.ConnCase

  alias UserApi.Integration
  @valid_attrs %{active: true, name: "some content", system: "some content", token: 42, unique_id: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, integration_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    integration = Repo.insert! %Integration{}
    conn = get conn, integration_path(conn, :show, integration)
    assert json_response(conn, 200)["data"] == %{"id" => integration.id,
      "unique_id" => integration.unique_id,
      "name" => integration.name,
      "system" => integration.system,
      "active" => integration.active,
      "token" => integration.token,
      "user_id" => integration.user_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, integration_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, integration_path(conn, :create), integration: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Integration, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, integration_path(conn, :create), integration: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    integration = Repo.insert! %Integration{}
    conn = put conn, integration_path(conn, :update, integration), integration: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Integration, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    integration = Repo.insert! %Integration{}
    conn = put conn, integration_path(conn, :update, integration), integration: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    integration = Repo.insert! %Integration{}
    conn = delete conn, integration_path(conn, :delete, integration)
    assert response(conn, 204)
    refute Repo.get(Integration, integration.id)
  end
end
