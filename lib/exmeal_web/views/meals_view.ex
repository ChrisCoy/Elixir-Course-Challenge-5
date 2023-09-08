defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  # import Ecto.Changeset

  alias Exmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      "meal" => %{
        "meal" => %{
          "calories" => meal.calories,
          "date" => meal.date,
          "description" => meal.description,
          "id" => meal.id
        }
      },
      "message" => "Meal created!"
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}) do
    %{
      meal: meal
    }
  end
end
