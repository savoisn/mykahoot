defmodule Kahoot.Poll do
  @moduledoc """
  The Poll context.
  """

  import Ecto.Query, warn: false
  alias Kahoot.Repo

  alias Kahoot.Poll.Quizz

  @doc """
  Returns the list of quizzes.

  ## Examples

      iex> list_quizzes()
      [%Quizz{}, ...]

  """
  def list_quizzes do
    Repo.all(Quizz)
  end

  @doc """
  Gets a single quizz.

  Raises `Ecto.NoResultsError` if the Quizz does not exist.

  ## Examples

      iex> get_quizz!(123)
      %Quizz{}

      iex> get_quizz!(456)
      ** (Ecto.NoResultsError)

  """
  def get_quizz!(id), do: Repo.get!(Quizz, id)

  @doc """
  Creates a quizz.

  ## Examples

      iex> create_quizz(%{field: value})
      {:ok, %Quizz{}}

      iex> create_quizz(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_quizz(attrs \\ %{}) do
    %Quizz{}
    |> Quizz.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a quizz.

  ## Examples

      iex> update_quizz(quizz, %{field: new_value})
      {:ok, %Quizz{}}

      iex> update_quizz(quizz, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_quizz(%Quizz{} = quizz, attrs) do
    quizz
    |> Quizz.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Quizz.

  ## Examples

      iex> delete_quizz(quizz)
      {:ok, %Quizz{}}

      iex> delete_quizz(quizz)
      {:error, %Ecto.Changeset{}}

  """
  def delete_quizz(%Quizz{} = quizz) do
    Repo.delete(quizz)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking quizz changes.

  ## Examples

      iex> change_quizz(quizz)
      %Ecto.Changeset{source: %Quizz{}}

  """
  def change_quizz(%Quizz{} = quizz) do
    Quizz.changeset(quizz, %{})
  end

  alias Kahoot.Poll.Question

  @doc """
  Returns the list of questions.

  ## Examples

      iex> list_questions()
      [%Question{}, ...]

  """
  def list_questions do
    Repo.all(Question)
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}, quizz_id) do
    %Question{}
    |> Question.changeset(Map.put(attrs, "quizz_id", quizz_id))
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{source: %Question{}}

  """
  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end

  alias Kahoot.Poll.Answer

  @doc """
  Returns the list of answers.

  ## Examples

      iex> list_answers()
      [%Answer{}, ...]

  """
  def list_answers do
    Repo.all(Answer)
  end

  @doc """
  Gets a single answer.

  Raises `Ecto.NoResultsError` if the Answer does not exist.

  ## Examples

      iex> get_answer!(123)
      %Answer{}

      iex> get_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_answer!(id), do: Repo.get!(Answer, id)

  @doc """
  Creates a answer.

  ## Examples

      iex> create_answer(%{field: value})
      {:ok, %Answer{}}

      iex> create_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_answer(attrs \\ %{}) do
    %Answer{}
    |> Answer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a answer.

  ## Examples

      iex> update_answer(answer, %{field: new_value})
      {:ok, %Answer{}}

      iex> update_answer(answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_answer(%Answer{} = answer, attrs) do
    answer
    |> Answer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Answer.

  ## Examples

      iex> delete_answer(answer)
      {:ok, %Answer{}}

      iex> delete_answer(answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_answer(%Answer{} = answer) do
    Repo.delete(answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking answer changes.

  ## Examples

      iex> change_answer(answer)
      %Ecto.Changeset{source: %Answer{}}

  """
  def change_answer(%Answer{} = answer) do
    Answer.changeset(answer, %{})
  end
end
