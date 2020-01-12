defmodule Kahoot.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :title, :string
      add :prop1, :string
      add :prop2, :string
      add :prop3, :string
      add :prop4, :string
      add :quizz_id, references(:quizzes, on_delete: :nothing)

      timestamps()
    end

    create index(:questions, [:quizz_id])
  end
end
