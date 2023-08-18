defmodule FactMap do
  def update!(map, key, default_value, update_func) do
    updated_func = fn existing_value ->
      existing_value ++ update_func.()
    end

    case Map.get(map, key) do
      nil ->
        case Map.update(map, key, default_value, updated_func) do
          {:ok, updated_map} -> updated_map
          :error -> Map.put(map, key, default_value)
        end

      existing_value when is_list(existing_value) ->
        updated_value = updated_func.(existing_value)

        case Map.update(map, key, updated_value, fn _ -> updated_value end) do
          {:ok, updated_map} -> updated_map
          :error -> Map.put(map, key, updated_value)
        end

      _ ->
        raise ArgumentError, "The value associated with the key must be a list."
    end
  end
end
