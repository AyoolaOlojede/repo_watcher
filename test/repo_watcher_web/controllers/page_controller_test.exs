defmodule RepoWatcherWeb.PageControllerTest do
  use RepoWatcherWeb.ConnCase

  import RepoWatcher.Factory

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "show git repos and renders repos when data is valid", %{conn: conn, jwt: jwt} do
    conn = conn |> put_req_header("authorization", "Token #{jwt}")
    conn = post(conn, page_path(conn, :show_details), username: @username)
    json = json_response(conn, 200)["git_response"]

    assert json == %{"username" => json["username"]}

  end

  test "does not show git repos and renders errors when token is invalid", %{conn: conn, jwt: jwt} do
    conn = conn |> put_req_header("authorization", "Token #{jwt}")
    conn = post(conn, page_path(conn, :show_details), username: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end


  test "does not show git repos and renders empty when username is missing or invalid", %{conn: conn, jwt: jwt} do
    conn = conn |> put_req_header("authorization", "Token #{jwt}")
    conn = post(conn, page_path(conn, :show_details), username: @invalid_attrs)
    assert json_response(conn, 200)["errors"] != %{}
  end

end
