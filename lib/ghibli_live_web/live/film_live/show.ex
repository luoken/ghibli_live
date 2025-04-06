defmodule GhibliLiveWeb.FilmLive.Show do
  use GhibliLiveWeb, :live_view

  alias GhibliLive.Fetch

  def mount(%{"id" => id} = _params, _session, socket) do
    {:ok, assign(socket, film: Fetch.fetch("films/#{id}"))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.link navigate="/films" class="underline">Back</.link>
      <div class="self-center">
        <div class="text-xl font-large text-center">{@film.title}</div>
        <img class="rounded-md max-w-64 text-center" src={@film.image} />
        <div>{@film.director}</div>
        <div>{@film.original_title}</div>
        <div>{@film.original_title_romanised}</div>
        <div>{@film.producer}</div>
        <div>{@film.description}</div>
        <div>{@film.release_date}</div>
        <div>{@film.rt_score}</div>
        <div>{@film.running_time}</div>
      </div>
    </div>
    """
  end
end
