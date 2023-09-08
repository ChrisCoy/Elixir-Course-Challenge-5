defmodule Exmeal.Meals.Get do
  alias Ecto.UUID
  alias Exmeal.{Repo, Meal}

  def by_id(id) do
    with {:ok, uuid} <- UUID.cast(id),
         %Meal{} = meal <- Repo.get(Meal, uuid) do
      {:ok, meal}
    else
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      nil -> {:error, %{status: :not_found, result: "Meal not found"}}
    end
  end
end
