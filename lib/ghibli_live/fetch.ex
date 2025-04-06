defmodule GhibliLive.Fetch do
  alias GhibliLive.Ghibli.Film

  @base_url "https://ghibliapi.vercel.app/"

  def fetch(query) do
    with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(@base_url <> query),
         {:ok, body} <- Jason.decode(body, keys: :atoms) do
      case body do
        body when is_list(body) -> Enum.map(body, fn film -> Film.new(film) end)
        body -> Film.new(body)
      end
    end
  end
end
