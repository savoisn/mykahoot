defmodule KahootWeb.QuizzController do
  use KahootWeb, :controller

  alias Kahoot.Poll
  alias Kahoot.Poll.Quizz

  def index(conn, _params) do
    quizzes = Poll.list_quizzes()
    render(conn, "index.html", quizzes: quizzes)
  end

  def new(conn, _params) do
    changeset = Poll.change_quizz(%Quizz{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"quizz" => quizz_params}) do
    case Poll.create_quizz(quizz_params) do
      {:ok, quizz} ->
        conn
        |> put_flash(:info, "Quizz created successfully.")
        |> redirect(to: Routes.quizz_path(conn, :show, quizz))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    quizz = Poll.get_quizz!(id)
    render(conn, "show.html", quizz: quizz)
  end

  def edit(conn, %{"id" => id}) do
    quizz = Poll.get_quizz!(id)
    changeset = Poll.change_quizz(quizz)
    render(conn, "edit.html", quizz: quizz, changeset: changeset)
  end

  def update(conn, %{"id" => id, "quizz" => quizz_params}) do
    quizz = Poll.get_quizz!(id)

    case Poll.update_quizz(quizz, quizz_params) do
      {:ok, quizz} ->
        conn
        |> put_flash(:info, "Quizz updated successfully.")
        |> redirect(to: Routes.quizz_path(conn, :show, quizz))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", quizz: quizz, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    quizz = Poll.get_quizz!(id)
    {:ok, _quizz} = Poll.delete_quizz(quizz)

    conn
    |> put_flash(:info, "Quizz deleted successfully.")
    |> redirect(to: Routes.quizz_path(conn, :index))
  end
end
