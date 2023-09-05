defmodule DroneShopWeb.DroneLive do
  use DroneShopWeb, :live_view


  alias DroneShop.Drones

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        filter: %{type: "", prices: []},
        drones: Drones.list_drones()
      )

    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    drone = Drones.get_drone!(id)
    {:noreply, assign(socket, selected_drone: drone, page_title: drone.name)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, assign(socket, selected_drone: hd(socket.assigns.drones))}
  end


  def render(assigns) do
    ~H"""
      <h1 class="text-6xl text-center mb-10">Inventory</h1>
      <.filter_form filter={@filter} />
      <div class="flex flex-row flex-wrap justify-center">
        <%= for drone <- @drones do %>
          <div class="max-w-sm rounded overflow-hidden shadow-lg mx-4 mt-3">
            <img class="w-full" src={drone.image}>
            <.link phx-click="more_info"  # patch={~p"/drone?#{[id: drone.id]}"} class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-3">More Info</.link>
            <div class="px-6 py-4">
              <p class="font-bold text-xl mb-2"><%= drone.model %>
              </p>
              <p class="text-gray-700 text-base">
                <%= drone.description %>
              </p>
              </div>
          </div>
          <% end %>
      </div>
    """
  end

  def handle_event("more_info", %{"id" => id}, socket) do
    IO.inspect(self(), label: "More Info Click")
    drone = Drones.get_drone!(id)
    {:noreply, assign(socket, selected_drone: drone, page_title: drone.name)}
  end

  def filter_form(assigns) do
    ~H"""
    <form phx-change="filter" class="text-center mb-10">
      <div class="">
        <select name="type" class="rounded-lg">
          <%= Phoenix.HTML.Form.options_for_select(
            type_options(),
            @filter.type
          ) %>
        </select>
        <div class="prices">
          <%= for price <- ["$", "$$", "$$$"] do %>
            <input
            class="rounded"
              type="checkbox"
              name="prices[]"
              value={price}
              id={price}
              checked={price in @filter.prices}
            />
            <label for={price}><%= price %></label>
          <% end %>
          <input type="hidden" name="prices[]" value="" />
        </div>
      </div>
    </form>
    """
  end

  def handle_event("filter", %{"type" => type, "prices" => prices}, socket) do
    filter = %{type: type, prices: prices}
    drones = Drones.list_drones(filter)
    {:noreply, assign(socket, drones: drones, filter: filter)}
  end

  def handle_event("filter", %{"id" => id}, socket) do
    filter = %{id: id}
    drones = Drones.list_drones(filter)
    {:noreply, assign(socket, drones: drones, filter: filter)}
  end

  defp type_options do
    [
      "All Types": "",
      Cinematic: "Cinematic",
      FPV: "FPV"
    ]
  end
end



# <%= if @selected_drone do %>
# <div class="max-w-sm rounded overflow-hidden shadow-lg mx-4 mt-3">
#   <img class="w-full" src={@selected_drone.image}>
#   <button phx-click="more_info" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-3">More Info</button>
#   <div class="px-6 py-4">
#     <p class="font-bold text-xl mb-2"><%= @selected_drone.model %>
#     </p>
#     <p class="text-gray-700 text-base">
#       <%= @selected_drone.description %>
#     </p>
#     </div>
# </div>
# <% end %>
