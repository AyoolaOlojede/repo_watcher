defmodule GitHubApiServices do

  def get_repo_details(user) do
    token =Application.get_env(:git_client, :github_personal_access_token)
    url = Application.get_env(:git_client, :git_url)
    headers = [{"Authorization", "bearer #{token}"}, {"Content-Type", "application/json"}]
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.post(url,Poison.encode!(%{"query" => query(user)}),headers)
    body
      |> Poison.decode!
      |> Kernel.get_in(["data", "user", "watching","edges"])
  end


  defp query(user_name) do
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
