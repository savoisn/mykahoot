defmodule Kahoot.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :owner, :string
      add :prop1, :boolean, default: false, null: false
      add :prop2, :boolean, default: false, null: false
      add :prop3, :boolean, default: false, null: false
      add :prop4, :boolean, default: false, null: false
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:answers, [:question_id])
  end
end
