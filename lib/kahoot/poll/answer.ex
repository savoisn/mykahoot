defmodule Kahoot.Poll.Answer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "answers" do
    field :owner, :string
    field :prop1, :boolean, default: false
    field :prop2, :boolean, default: false
    field :prop3, :boolean, default: false
    field :prop4, :boolean, default: false
    field :question_id, :id

    timestamps()
  end

  @doc false
  def changeset(answer, attrs) do
    answer
    |> cast(attrs, [:owner, :prop1, :prop2, :prop3, :prop4])
    |> validate_required([:owner, :prop1, :prop2, :prop3, :prop4])
  end
end
