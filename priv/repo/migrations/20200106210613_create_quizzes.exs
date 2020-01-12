defmodule Kahoot.Repo.Migrations.CreateQuizzes do
  use Ecto.Migration

  def change do
    create table(:quizzes) do
      add :owner, :string
      add :name, :string

      timestamps()
    end

  end
end
