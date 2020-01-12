defmodule KahootWeb.QuestionControllerTest do
  use KahootWeb.ConnCase

  alias Kahoot.Poll

  @create_attrs %{prop1: "some prop1", prop2: "some prop2", prop3: "some prop3", prop4: "some prop4", title: "some title"}
  @update_attrs %{prop1: "some updated prop1", prop2: "some updated prop2", prop3: "some updated prop3", prop4: "some updated prop4", title: "some updated title"}
  @invalid_attrs %{prop1: nil, prop2: nil, prop3: nil, prop4: nil, title: nil}

  def fixture(:question) do
    {:ok, question} = Poll.create_question(@create_attrs)
    question
  end

  describe "index" do
    test "lists all questions", %{conn: conn} do
      conn = get(conn, Routes.question_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Questions"
    end
  end

  describe "new question" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.question_path(conn, :new))
      assert html_response(conn, 200) =~ "New Question"
    end
  end

  describe "create question" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.question_path(conn, :create), question: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.question_path(conn, :show, id)

      conn = get(conn, Routes.question_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Question"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.question_path(conn, :create), question: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Question"
    end
  end

  describe "edit question" do
    setup [:create_question]

    test "renders form for editing chosen question", %{conn: conn, question: question} do
      conn = get(conn, Routes.question_path(conn, :edit, question))
      assert html_response(conn, 200) =~ "Edit Question"
    end
  end

  describe "update question" do
    setup [:create_question]

    test "redirects when data is valid", %{conn: conn, question: question} do
      conn = put(conn, Routes.question_path(conn, :update, question), question: @update_attrs)
      assert redirected_to(conn) == Routes.question_path(conn, :show, question)

      conn = get(conn, Routes.question_path(conn, :show, question))
      assert html_response(conn, 200) =~ "some updated prop1"
    end

    test "renders errors when data is invalid", %{conn: conn, question: question} do
      conn = put(conn, Routes.question_path(conn, :update, question), question: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Question"
    end
  end

  describe "delete question" do
    setup [:create_question]

    test "deletes chosen question", %{conn: conn, question: question} do
      conn = delete(conn, Routes.question_path(conn, :delete, question))
      assert redirected_to(conn) == Routes.question_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.question_path(conn, :show, question))
      end
    end
  end

  defp create_question(_) do
    question = fixture(:question)
    {:ok, question: question}
  end
end
