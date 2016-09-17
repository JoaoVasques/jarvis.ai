defmodule UserApi.IntegrationView do
  use UserApi.Web, :view

  def render("index.json", %{integrations: integrations}) do
    %{data: render_many(integrations, UserApi.IntegrationView, "integration.json")}
  end

  def render("show.json", %{integration: integration}) do
    %{data: render_one(integration, UserApi.IntegrationView, "integration.json")}
  end

  def render("integration.json", %{integration: integration}) do
    %{id: integration.id,
      unique_id: integration.unique_id,
      name: integration.name,
      system: integration.system,
      active: integration.active,
      token: integration.token,
      user_id: integration.user_id}
  end
end
