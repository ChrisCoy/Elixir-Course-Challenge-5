defmodule Exmeal.Error do
# TO DO
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys
end
