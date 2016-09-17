defmodule UserApi.Integration do
  use UserApi.Web, :model

  schema "integrations" do
    field :unique_id, :string
    field :name, :string
    field :system, :string
    field :active, :boolean, default: false
    field :token, :string
    belongs_to :user, UserApi.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:unique_id, :name, :system, :active, :token])
    |> validate_required([:unique_id, :name, :system, :active, :token])
  end
end
