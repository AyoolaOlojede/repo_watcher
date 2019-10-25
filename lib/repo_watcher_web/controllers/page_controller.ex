defmodule RepoWatcherWeb.PageController do
  use RepoWatcherWeb, :controller
  import HTTPoison
  import Poison



  def index(conn, _params) do
    user="AyoolaOlojede"
    HTTPoison.start()
    token =Application.get_env(:tokens, :github_personal_access_token)
    url = "https://api.github.com/graphql"
    headers = [{"Authorization", "bearer #{token}"}, {"Content-Type", "application/json"}]
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.post(url,Poison.encode!(%{"query" => query(user)}),headers)
    repos = body
      |> Poison.decode!
      |> Kernel.get_in(["data", "user", "watching","edges"])

    render(conn, "index.html",git_response: repos)

  end


  def query(user_name) do
      "query {
        user(login: \"#{user_name}\") {
          watching(last:100) {
            edges {
              node {
                name
                url
              }
            }
          }
        }
      }"
  end
end
