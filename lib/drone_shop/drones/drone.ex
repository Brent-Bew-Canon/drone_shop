defmodule DroneShop.Drones.Drone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drones" do
    field(:name, :string)
    field(:model, :string)
    field(:type, :string)
    field(:price, :string)
    field(:image, :string)
    field(:description, :string)

    timestamps()
  end

  @doc false
  def changeset(boat, attrs) do
    boat
    |> cast(attrs, [:model, :name, :type, :price, :image, :description])
    |> validate_required([:model, :name, :type, :price, :image, :description])
  end
end
