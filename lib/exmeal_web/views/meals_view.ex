defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  # import Ecto.Changeset

  alias Exmeal.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: %{
        meal: meal
      }
    }
  end

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end
