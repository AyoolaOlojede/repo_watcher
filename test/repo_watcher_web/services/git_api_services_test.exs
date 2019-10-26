defmodule RepoWatcherWeb.GitApiServicesTest do

  test "show git repos and renders repos when data is valid", %{user: user} do
    conn = post(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

end
