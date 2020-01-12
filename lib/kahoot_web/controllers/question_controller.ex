defmodule KahootWeb.QuestionController do
  use KahootWeb, :controller

  alias Kahoot.Poll
  alias Kahoot.Poll.Question

  def index(conn, %{"quizz_id" => quizz_id}) do
    questions = Poll.list_questions()
    render(conn, "index.html", %{questions: questions, quizz_id: quizz_id})
  end

  def new(conn, %{"quizz_id" => quizz_id}) do
    changeset = Poll.change_question(%Question{})
    render(conn, "new.html", %{changeset: changeset, quizz_id: quizz_id})
  end

  def create(conn, %{"question" => question_params, "quizz_id" => quizz_id}) do
    case Poll.create_question(question_params, quizz_id) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.question_path(conn, :show, quizz_id, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"quizz_id" => quizz_id, "id" => id}) do
    question = Poll.get_question!(id)
    render(conn, "show.html", %{question: question, quizz_id: quizz_id})
  end

  def edit(conn, %{"quizz_id" => quizz_id, "id" => id}) do
    question = Poll.get_question!(id)
    changeset = Poll.change_question(question)
    render(conn, "edit.html", %{question: question, changeset: changeset, quizz_id: quizz_id})
  end

  def update(conn, %{"quizz_id" => quizz_id, "id" => id, "question" => question_params}) do
    question = Poll.get_question!(id)

    case Poll.update_question(question, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question updated successfully.")
        |> redirect(to: Routes.question_path(conn, :show, quizz_id, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", question: question, changeset: changeset, quizz_id: quizz_id)
    end
  end

  def delete(conn, %{"quizz_id" => quizz_id, "id" => id}) do
    question = Poll.get_question!(id)
    {:ok, _question} = Poll.delete_question(question)

    conn
    |> put_flash(:info, "Question deleted successfully.")
    |> redirect(to: Routes.question_path(conn, :index, quizz_id))
  end
end
