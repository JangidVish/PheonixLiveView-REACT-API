defmodule ForumWeb.PostController do
  use ForumWeb, :controller

  alias Forum.Posts
  alias Forum.Posts.Post

  action_fallback ForumWeb.FallbackController

  def index(conn, _params) do
    post = Posts.list_post()
    render(conn, :index, post: post)
  end

  def create(conn, %{"post" => post_params}) do
    with {:ok, %Post{} = post} <- Posts.create_post(post_params) do
      IO.inspect(post_params)
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/post/#{post}")
      |> render(:show, post: post)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    render(conn, :show, post: post)
  end

  @spec update(any(), map()) :: any()
  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    with {:ok, %Post{} = post} <- Posts.update_post(post, post_params) do
      render(conn, :show, post: post)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)

    with {:ok, %Post{}} <- Posts.delete_post(post) do
      send_resp(conn, :no_content, "")
    end
  end
end
