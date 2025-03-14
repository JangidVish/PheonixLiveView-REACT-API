defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def user(conn, _params) do
    # IO.puts("Users function hit!")
    users=[
      %{id: 1, name: "Alice", email: "alice@example.com"},
      %{id: 2, name: "Bob", email: "bob@example.com"},
    ]
    # render(conn, :users,users: users, layout: false)

    json(conn, %{users: users})
  end
end
