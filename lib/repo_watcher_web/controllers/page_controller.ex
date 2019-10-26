defmodule RepoWatcherWeb.PageController do
  use RepoWatcherWeb, :controller

  import GitHubApiServices


  def index(conn, _params) do

    render(conn, "index.html",git_response: nil)

  end


  def show_details(conn,params) do
    user=params["username"]
    repos=get_repo_details(user)
    render(conn, "index.html",git_response: repos)
  end



end
