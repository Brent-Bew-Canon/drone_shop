defmodule DroneShop.Drones.Drone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drones" do
    field(:name, :string)
    field(:model, :string)
    field(:type, :string)
    field(:price, :string)
    field(:cost, :string)
    field(:image, :string)
    field(:description, :string)
    field(:sensor, :string)
    field(:flight_time, :string)
    field(:link, :string)

    timestamps()
  end

  @doc false
  def changeset(boat, attrs) do
    boat
    |> cast(attrs, [:model, :name, :type, :price, :cost, :image, :description, :sensor, :flight_time, :link])
    |> validate_required([:model, :name, :type, :price, :cost, :image, :description, :sensor, :flight_time, :link])
  end
end
