defmodule ForumWeb.PostJSON do
  alias Forum.Posts.Post

  @doc """
  Renders a list of post.
  """
  def index(%{post: post}) do
    %{data: for(post <- post, do: data(post))}
  end

  @doc """
  Renders a single post.
  """
  def show(%{post: post}) do
    %{data: data(post)}
  end

  defp data(%Post{} = post) do
    %{
      id: post.id,
      body: post.body,
      title: post.title,
      user_id: post.user_id,
    }
  end
end
