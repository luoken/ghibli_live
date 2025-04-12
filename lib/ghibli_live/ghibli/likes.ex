defmodule GhibliLive.Ghibli.Likes do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :string, autogenerate: false}

  schema "likes" do
    field :likes, :integer
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(likes, attrs) do
    likes
    |> cast(attrs, [:likes])
    |> validate_required([:likes])
  end
end
