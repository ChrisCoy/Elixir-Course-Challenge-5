defmodule Exmeal.Meals.Update do
  alias Ecto.Changeset
  alias Ecto.UUID
  alias Exmeal.{Repo, Meal}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, %{status: :not_found, result: "Meal not found"}}
      meal -> do_update(meal, params)
    end
  end

  defp do_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
