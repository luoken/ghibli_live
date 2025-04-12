defmodule GhibliLive.Likes do
  alias GhibliLive.Ghibli.Likes
  alias GhibliLive.Repo

  def insert_or_update(id, like_value) do
    likes =
      Likes
      |> Repo.get(id)
      |> case do
        nil -> %Likes{id: id, likes: 0}
        likes -> likes
      end

    Likes.changeset(likes, %{likes: likes.likes + like_value})
    |> Repo.insert_or_update()
  end

  def get_likes(id) do
    Likes
    |> Repo.get(id)
    |> case do
      nil -> 0
      likes -> likes.likes
    end
  end
end
