defmodule ExmealWeb.MealsController do
  alias ExmealWeb.FallbackController
  alias Exmeal.Meal
  use ExmealWeb, :controller
  # use

  action_fallback(FallbackController)

  def create(conn, params) do
    res = Exmeal.create_meal(params)

    IO.inspect(res, label: "hello result")

    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    else
      {:error, %{status: status, result: result}} ->
        conn
        |> put_status(status)
        |> put_view(ExmealWeb.ErrorView)
        |> render("error.json", result: result)
    end
  end

  def delete(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.delete_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)

      # else
      #   {:error, change_set} -> conn |>
    end
  end

  # def call(conn, {:error, %Error{result: result, status: status}}) do
  #   conn
  #   |> put_status(status)
  #   |> put_view(ErrorView)
  #   |> render("error.json", result: result)
  # end
end
