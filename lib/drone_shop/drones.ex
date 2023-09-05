defmodule DroneShop.Drones do
  @moduledoc """
  The Drones context.
  """

  import Ecto.Query, warn: false
  alias DroneShop.Repo

  alias DroneShop.Drones.Drone

  @doc """
  Returns the list of drones.

  ## Examples

      iex> list_drones()
      [%Drone{}, ...]

  """
  def list_drones do
    Repo.all(Drone)
  end

  @doc """
  Returns a list of drones matching the given `filter`.

  Example filter:

  %{type: "sporting", prices: ["$", "$$"]}
  """
  def list_drones(filter) when is_map(filter) do
    from(Drone)
    |> filter_by_type(filter)
    |> filter_by_prices(filter)
    |> Repo.all()
  end

  defp filter_by_type(query, %{type: ""}), do: query

  defp filter_by_type(query, %{type: type}) do
    where(query, type: ^type)
  end

  defp filter_by_prices(query, %{prices: [""]}), do: query

  defp filter_by_prices(query, %{prices: prices}) do
    where(query, [drone], drone.price in ^prices)
  end

  @doc """
  Gets a single drone.

  Raises `Ecto.NoResultsError` if the Drone does not exist.

  ## Examples

      iex> get_drone!(123)
      %Drone{}

      iex> get_drone!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drone!(id), do: Repo.get!(Drone, id)

  @doc """
  Creates a drone.

  ## Examples

      iex> create_drone(%{field: value})
      {:ok, %Drone{}}

      iex> create_drone(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drone(attrs \\ %{}) do
    %Drone{}
    |> Drone.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drone.

  ## Examples

      iex> update_drone(drone, %{field: new_value})
      {:ok, %Drone{}}

      iex> update_drone(drone, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drone(%Drone{} = drone, attrs) do
    drone
    |> Drone.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a drone.

  ## Examples

      iex> delete_drone(drone)
      {:ok, %Drone{}}

      iex> delete_drone(drone)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drone(%Drone{} = drone) do
    Repo.delete(drone)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drone changes.

  ## Examples

      iex> change_drone(drone)
      %Ecto.Changeset{data: %Drone{}}

  """
  def change_drone(%Drone{} = drone, attrs \\ %{}) do
    Drone.changeset(drone, attrs)
  end
end
