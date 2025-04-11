defmodule GhibliLiveWeb.FilmLive.Show do
  use GhibliLiveWeb, :live_view

  alias Ghibli.Film

  def mount(%{"id" => id} = _params, _session, socket) do
    {:ok, film} = Film.get_by(id)
    {:ok, assign(socket, film: film)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.link navigate="/films" class="underline">Back</.link>
      <div class="text-center mx-auto">
        <div class="text-xl font-large text-center">{@film.title}</div>
        <div class="flex justify-center pt-5">
          <img class="rounded-md max-w-64 m-l-auto mr-2" src={@film.image} />
          <div class="flex-row m-r-auto ml-2  text-left">
            <div class="mx-auto max-w-96">{@film.description}</div>
            <div>Release Year:{@film.release_date}</div>
            <div>Rotten Tomatoes Score: {@film.rt_score}</div>
            <div>Running Time: {@film.running_time} Minutes</div>
          </div>
        </div>
        <div>Title Original: {@film.original_title}</div>
        <div>Title Romanised: {@film.original_title_romanised}</div>
        <div>Director: {@film.director}</div>
        <div>Producer: {@film.producer}</div>
      </div>
    </div>
    """
  end
end
