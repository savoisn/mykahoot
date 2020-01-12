defmodule KahootWeb.QuizzControllerTest do
  use KahootWeb.ConnCase

  alias Kahoot.Poll

  @create_attrs %{name: "some name", owner: "some owner"}
  @update_attrs %{name: "some updated name", owner: "some updated owner"}
  @invalid_attrs %{name: nil, owner: nil}

  def fixture(:quizz) do
    {:ok, quizz} = Poll.create_quizz(@create_attrs)
    quizz
  end

  describe "index" do
    test "lists all quizzes", %{conn: conn} do
      conn = get(conn, Routes.quizz_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Quizzes"
    end
  end

  describe "new quizz" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.quizz_path(conn, :new))
      assert html_response(conn, 200) =~ "New Quizz"
    end
  end

  describe "create quizz" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.quizz_path(conn, :create), quizz: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.quizz_path(conn, :show, id)

      conn = get(conn, Routes.quizz_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Quizz"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.quizz_path(conn, :create), quizz: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Quizz"
    end
  end

  describe "edit quizz" do
    setup [:create_quizz]

    test "renders form for editing chosen quizz", %{conn: conn, quizz: quizz} do
      conn = get(conn, Routes.quizz_path(conn, :edit, quizz))
      assert html_response(conn, 200) =~ "Edit Quizz"
    end
  end

  describe "update quizz" do
    setup [:create_quizz]

    test "redirects when data is valid", %{conn: conn, quizz: quizz} do
      conn = put(conn, Routes.quizz_path(conn, :update, quizz), quizz: @update_attrs)
      assert redirected_to(conn) == Routes.quizz_path(conn, :show, quizz)

      conn = get(conn, Routes.quizz_path(conn, :show, quizz))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, quizz: quizz} do
      conn = put(conn, Routes.quizz_path(conn, :update, quizz), quizz: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Quizz"
    end
  end

  describe "delete quizz" do
    setup [:create_quizz]

    test "deletes chosen quizz", %{conn: conn, quizz: quizz} do
      conn = delete(conn, Routes.quizz_path(conn, :delete, quizz))
      assert redirected_to(conn) == Routes.quizz_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.quizz_path(conn, :show, quizz))
      end
    end
  end

  defp create_quizz(_) do
    quizz = fixture(:quizz)
    {:ok, quizz: quizz}
  end
end
