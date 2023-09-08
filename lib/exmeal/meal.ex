defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date, :calories]

  schema "meal" do
    field(:calories, :integer)
    field(:date, :date)
    field(:description, :string)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
