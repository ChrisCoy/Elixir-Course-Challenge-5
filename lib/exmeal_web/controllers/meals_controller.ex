defmodule ExmealWeb.MealsController do
  alias ExmealWeb.ErrorView
  alias ExmealWeb.FallbackController
  alias Exmeal.Meal
  use ExmealWeb, :controller
  # use

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    else
      {:error, %{status: status, result: result}} ->
        conn
        |> put_status(status)
        |> put_view(ErrorView)
        |> render("error.json", result: result)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    else
      {:error, %{status: status, result: result}} ->
        conn
        |> put_status(status)
        |> put_view(ErrorView)
        |> render("error.json", result: result)
    end
  end

  def delete(conn, %{"id" => id}) do
    # IO.inspect(params, label: "aaaaa")

    with {:ok, %Meal{}} <- Exmeal.delete_meal(id) do
      conn |> put_status(:no_content) |> text("")
    else
      {:error, %{status: status, result: result}} ->
        conn
        |> put_status(status)
        |> put_view(ErrorView)
        |> render("error.json", result: result)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    else
      {:error, %{status: status, result: result}} ->
        conn
        |> put_status(status)
        |> put_view(ErrorView)
        |> render("error.json", result: result)
    end
  end

  # def call(conn, {:error, %Error{result: result, status: status}}) do
  #   conn
  #   |> put_status(status)
  #   |> put_view(ErrorView)
  #   |> render("error.json", result: result)
  # end
end
