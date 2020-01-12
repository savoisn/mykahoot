defmodule KahootWeb.AnswerController do
  use KahootWeb, :controller

  alias Kahoot.Poll
  alias Kahoot.Poll.Answer

  def index(conn, _params) do
    answers = Poll.list_answers()
    render(conn, "index.html", answers: answers)
  end

  def new(conn, _params) do
    changeset = Poll.change_answer(%Answer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"answer" => answer_params}) do
    case Poll.create_answer(answer_params) do
      {:ok, answer} ->
        conn
        |> put_flash(:info, "Answer created successfully.")
        |> redirect(to: Routes.answer_path(conn, :show, answer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    answer = Poll.get_answer!(id)
    render(conn, "show.html", answer: answer)
  end

  def edit(conn, %{"id" => id}) do
    answer = Poll.get_answer!(id)
    changeset = Poll.change_answer(answer)
    render(conn, "edit.html", answer: answer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "answer" => answer_params}) do
    answer = Poll.get_answer!(id)

    case Poll.update_answer(answer, answer_params) do
      {:ok, answer} ->
        conn
        |> put_flash(:info, "Answer updated successfully.")
        |> redirect(to: Routes.answer_path(conn, :show, answer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", answer: answer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    answer = Poll.get_answer!(id)
    {:ok, _answer} = Poll.delete_answer(answer)

    conn
    |> put_flash(:info, "Answer deleted successfully.")
    |> redirect(to: Routes.answer_path(conn, :index))
  end
end
