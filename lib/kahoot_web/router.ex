defmodule KahootWeb.Router do
  use KahootWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KahootWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/quizzes", QuizzController
    resources "/quizzes/:quizz_id/questions", QuestionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", KahootWeb do
  #   pipe_through :api
  # end
end
