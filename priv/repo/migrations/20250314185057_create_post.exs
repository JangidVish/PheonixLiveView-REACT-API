defmodule Forum.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :body, :string
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
