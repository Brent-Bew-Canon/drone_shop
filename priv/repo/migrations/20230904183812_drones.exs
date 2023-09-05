defmodule DroneShop.Repo.Migrations.Drones do
  use Ecto.Migration

  def change do
    create table(:drones) do
      add(:name, :string)
      add(:model, :string)
      add(:type, :string)
      add(:price, :string)
      add(:image, :string)
      add(:description, :text)

      timestamps()
    end
  end
end
