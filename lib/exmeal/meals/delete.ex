defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Meal, Repo}

  def call(%{"id" => id}) do
    Repo.delete(Meal, id)
  end
end
