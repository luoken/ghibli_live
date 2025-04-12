defmodule GhibliLive.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes, primary_key: false) do
      add :id, :string, primary_key: true
      add :likes, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
