defmodule GhibliLiveWeb.FilmLive.Index do
  use GhibliLiveWeb, :live_view

  alias Ghibli.Film

  def mount(_params, _session, socket) do
    {:ok, films} = Film.all()

    socket =
      socket
      |> assign(page_title: "Films")
      |> assign(films: films)
      |> assign(search: to_form(%{}))

    {:ok, socket}
  end

  def handle_event("search", %{"title" => title}, %{assigns: %{films: films}} = socket) do
    filtered_films =
      if(title == nil || String.trim(title) == "") do
        {:ok, films} = Film.all()
        films
      else
        Enum.filter(films, fn film ->
          String.contains?(String.downcase(film.title), String.downcase(title))
        end)
      end

    {:noreply, assign(socket, films: filtered_films)}
  end

  def render(assigns) do
    ~H"""
    <div class="w-5/6 mx-auto">
      <.form for={@search} phx-change="search">
        <.input field={@search[:title]} placeholder="Search..." autocomplete="off" />
      </.form>
      <div class="text-xl font-large text-center">
        Films
      </div>
      <div class="flex flex-wrap justify-between">
        <.film_card :for={film <- @films} film={film} />
      </div>
    </div>
    """
  end

  def film_card(assigns) do
    ~H"""
    <.link patch={~p"/film/#{@film}"} id={@film.id}>
      <div class="m-1 p-2 rounded-md border border-gray-300">
        <img class="rounded-md max-w-80" src={@film.image} />

        <div class="text-xl font-small text-center">{@film.title}</div>
        <div class="font-small text-center">{@film.original_title}</div>
      </div>
    </.link>
    """
  end
end
