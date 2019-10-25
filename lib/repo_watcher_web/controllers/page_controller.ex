defmodule RepoWatcherWeb.PageController do
  use RepoWatcherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
