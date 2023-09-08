defmodule Exmeal.Meals.Update do
  alias Exmeal.Meal

  def call(id, %Meal{} = meal) do
    IO.inspect(meal, label: "LABELLLL")
    IO.inspect(id, label: "idddddd")
  end
end
