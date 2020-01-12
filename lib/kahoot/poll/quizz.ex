defmodule Kahoot.Poll.Quizz do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quizzes" do
    field :name, :string
    field :owner, :string

    timestamps()
  end

  @doc false
  def changeset(quizz, attrs) do
    quizz
    |> cast(attrs, [:owner, :name])
    |> validate_required([:owner, :name])
  end
end
