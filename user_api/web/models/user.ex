defmodule UserApi.User do
  use UserApi.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :age, :integer
    field :password, :string
    has_many :integrations, UserApi.Integration

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :email, :age, :password])
    |> validate_required([:first_name, :last_name, :email, :age, :password])
  end
end
