defmodule Kahoot.Poll.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :prop1, :string
    field :prop2, :string
    field :prop3, :string
    field :prop4, :string
    field :title, :string
    field :quizz_id, :id

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:title, :prop1, :prop2, :prop3, :prop4, :quizz_id])
    |> validate_required([:title, :prop1, :prop2, :prop3, :prop4, :quizz_id])
  end
end
