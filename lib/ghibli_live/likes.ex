defmodule GhibliLive.Likes do
  alias GhibliLive.Ghibli.Likes
  alias GhibliLive.Repo

  def insert_or_update(id) do
    Likes
    |> Repo.get(id)
    |> case do
      nil -> %Likes{id: id, likes: 1}
      likes -> likes
    end
    |> IO.inspect(label: "GET")
    |> Likes.changeset()
    |> IO.inspect(label: "CHANGESET")
    |> Repo.insert_or_update()
    |> IO.inspect()
  end
end
