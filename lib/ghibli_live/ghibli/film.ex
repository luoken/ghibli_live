defmodule GhibliLive.Ghibli.Film do
  defstruct [
    :id,
    :description,
    :director,
    :image,
    :locations,
    :movie_banner,
    :original_title,
    :original_title_romanised,
    :people,
    :producer,
    :release_date,
    :rt_score,
    :running_time,
    :species,
    :title,
    :url,
    :vehicles
  ]

  def new(), do: __struct__()

  def new(args), do: __struct__(args)
end
