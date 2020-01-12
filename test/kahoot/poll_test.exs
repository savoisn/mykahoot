defmodule Kahoot.PollTest do
  use Kahoot.DataCase

  alias Kahoot.Poll

  describe "quizzes" do
    alias Kahoot.Poll.Quizz

    @valid_attrs %{name: "some name", owner: "some owner"}
    @update_attrs %{name: "some updated name", owner: "some updated owner"}
    @invalid_attrs %{name: nil, owner: nil}

    def quizz_fixture(attrs \\ %{}) do
      {:ok, quizz} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Poll.create_quizz()

      quizz
    end

    test "list_quizzes/0 returns all quizzes" do
      quizz = quizz_fixture()
      assert Poll.list_quizzes() == [quizz]
    end

    test "get_quizz!/1 returns the quizz with given id" do
      quizz = quizz_fixture()
      assert Poll.get_quizz!(quizz.id) == quizz
    end

    test "create_quizz/1 with valid data creates a quizz" do
      assert {:ok, %Quizz{} = quizz} = Poll.create_quizz(@valid_attrs)
      assert quizz.name == "some name"
      assert quizz.owner == "some owner"
    end

    test "create_quizz/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poll.create_quizz(@invalid_attrs)
    end

    test "update_quizz/2 with valid data updates the quizz" do
      quizz = quizz_fixture()
      assert {:ok, %Quizz{} = quizz} = Poll.update_quizz(quizz, @update_attrs)
      assert quizz.name == "some updated name"
      assert quizz.owner == "some updated owner"
    end

    test "update_quizz/2 with invalid data returns error changeset" do
      quizz = quizz_fixture()
      assert {:error, %Ecto.Changeset{}} = Poll.update_quizz(quizz, @invalid_attrs)
      assert quizz == Poll.get_quizz!(quizz.id)
    end

    test "delete_quizz/1 deletes the quizz" do
      quizz = quizz_fixture()
      assert {:ok, %Quizz{}} = Poll.delete_quizz(quizz)
      assert_raise Ecto.NoResultsError, fn -> Poll.get_quizz!(quizz.id) end
    end

    test "change_quizz/1 returns a quizz changeset" do
      quizz = quizz_fixture()
      assert %Ecto.Changeset{} = Poll.change_quizz(quizz)
    end
  end

  describe "questions" do
    alias Kahoot.Poll.Question

    @valid_attrs %{prop1: "some prop1", prop2: "some prop2", prop3: "some prop3", prop4: "some prop4", title: "some title"}
    @update_attrs %{prop1: "some updated prop1", prop2: "some updated prop2", prop3: "some updated prop3", prop4: "some updated prop4", title: "some updated title"}
    @invalid_attrs %{prop1: nil, prop2: nil, prop3: nil, prop4: nil, title: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Poll.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Poll.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Poll.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Poll.create_question(@valid_attrs)
      assert question.prop1 == "some prop1"
      assert question.prop2 == "some prop2"
      assert question.prop3 == "some prop3"
      assert question.prop4 == "some prop4"
      assert question.title == "some title"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poll.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Poll.update_question(question, @update_attrs)
      assert question.prop1 == "some updated prop1"
      assert question.prop2 == "some updated prop2"
      assert question.prop3 == "some updated prop3"
      assert question.prop4 == "some updated prop4"
      assert question.title == "some updated title"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Poll.update_question(question, @invalid_attrs)
      assert question == Poll.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Poll.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Poll.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Poll.change_question(question)
    end
  end

  describe "answers" do
    alias Kahoot.Poll.Answer

    @valid_attrs %{owner: "some owner", prop1: true, prop2: true, prop3: true, prop4: true}
    @update_attrs %{owner: "some updated owner", prop1: false, prop2: false, prop3: false, prop4: false}
    @invalid_attrs %{owner: nil, prop1: nil, prop2: nil, prop3: nil, prop4: nil}

    def answer_fixture(attrs \\ %{}) do
      {:ok, answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Poll.create_answer()

      answer
    end

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Poll.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Poll.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      assert {:ok, %Answer{} = answer} = Poll.create_answer(@valid_attrs)
      assert answer.owner == "some owner"
      assert answer.prop1 == true
      assert answer.prop2 == true
      assert answer.prop3 == true
      assert answer.prop4 == true
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poll.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{} = answer} = Poll.update_answer(answer, @update_attrs)
      assert answer.owner == "some updated owner"
      assert answer.prop1 == false
      assert answer.prop2 == false
      assert answer.prop3 == false
      assert answer.prop4 == false
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Poll.update_answer(answer, @invalid_attrs)
      assert answer == Poll.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Poll.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Poll.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Poll.change_answer(answer)
    end
  end
end
