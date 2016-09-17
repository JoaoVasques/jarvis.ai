defmodule UserApi.IntegrationController do
  use UserApi.Web, :controller

  alias UserApi.Integration

  plug :scrub_params, "integration" when action in [:create, :update]
  plug :assign_user
  
  def index(conn, _params) do
    integrations = Repo.all(assoc(conn.assigns[:user], :integrations))
    render(conn, "index.json", integrations: integrations)
  end

  def create(conn, %{"integration" => integration_params}) do
    changeset =
        conn.assigns[:user]
        |> build_assoc(:integrations)
        |> Integration.changeset(integration_params)
    
    case Repo.insert(changeset) do
      {:ok, integration} ->
        conn
        |> put_status(:created)
        |> render("show.json", integration: integration)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(UserApi.ChangesetView, "error.json", changeset: changeset)          
    end
  end

  def show(conn, %{"id" => id}) do
    integration = Repo.get!(assoc(conn.assigns[:user], :integrations), id)
    render(conn, "show.json", integration: integration)
  end

  def update(conn, %{"id" => id, "integration" => integration_params}) do
    integration = Repo.get!(assoc(conn.assigns[:user], :integrations), id)
    changeset = Integration.changeset(integration, integration_params)

    case Repo.update(changeset) do
      {:ok, integration} ->
        render(conn, "show.json", integration: integration)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(UserApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    integration = Repo.get!(assoc(conn.assigns[:user], :integrations), id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(integration)

    send_resp(conn, :no_content, "")
  end

  defp assign_user(conn, _opts) do
    case conn.params do
      %{"user_id" => user_id} ->
        user = Repo.get(UserApi.User, user_id)
        assign(conn, :user, user)
      _ ->
        conn
    end
  end
end
