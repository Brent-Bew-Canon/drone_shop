defmodule DroneShopWeb.DroneLive do
  use DroneShopWeb, :live_view


  alias DroneShop.Drones

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        filter: %{type: "", prices: []},
        drones: Drones.list_drones(),
        show_focused_drone: false
      )

    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    drone = Drones.get_drone!(id)
    {:noreply, assign(socket, selected_drone: drone, page_title: drone.name, show_focused_drone: true)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, assign(socket, selected_drone: nil, show_focused_drone: false)}
  end


  def render(assigns) do
    ~H"""
      <%= if @show_focused_drone == false do %>
      <h1 class="text-6xl text-center mb-10">Inventory</h1>
      <.filter_form filter={@filter} />
      <div class="flex flex-row flex-wrap justify-center mb-16">
        <%= for drone <- @drones do %>
          <div class="max-w-sm rounded overflow-hidden shadow-lg mx-4 mt-3">
            <img class="w-full" src={drone.image}>
            <div class="text-center mb-3">
            <.link phx-click="more_info" patch={~p"/drone?#{[id: drone.id]}"} class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-3">More Info</.link>
            </div>
            <div class="px-6 py-4">
              <p class="font-bold text-xl mb-2 text-center"><%= drone.model %>
              </p>
              <p class="text-gray-700 text-base">
                <%= drone.description %>
              </p>
              </div>
          </div>
          <% end %>
      </div>
      <% end %>
      <%= if @show_focused_drone == true do %>
        <.focused_drone selected_drone={@selected_drone} />
      <% end %>
    """
  end

  def filter_form(assigns) do
    ~H"""
    <form phx-change="filter" class="text-center mb-5">
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


  def focused_drone(assigns) do
    ~H"""
    <div class="flex flex-row flex-wrap justify-center mb-24">
      <div class="max-w-2xl rounded overflow-hidden shadow-lg mx-4 mt-3">
        <img class="w-2/3 mx-auto" src={@selected_drone.image}>
        <div class="px-6 pb-4">
          <p class="font-bold text-2xl mb-2 text-center"><%= @selected_drone.model %>
          </p>
          <p class="font-bold text-xl mb-2 text-center"><%= @selected_drone.cost %>
          </p>
          <p class="text-gray-700 text-base">
            <%= @selected_drone.description %>
          </p>
          <p class="pt-4 text-gray-700 text-base mb-2"> <span class="font-bold">Type:</span> <%= @selected_drone.type %>
          </p>
          <p class="pt-4 text-gray-700 text-base mb-2"> <span class="font-bold">Sensor:</span> <%= @selected_drone.sensor %>
          </p>
          <p class="pt-4 text-gray-700 text-base mb-2"><span class="font-bold">Max Flight Time:</span> <%= @selected_drone.flight_time %>
          </p>
          <div class="mt-6 flex flex-row flex-wrap justify-center">
            <.link phx-click="back" patch={~p"/drone"} class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-3 mx-2">Go Back</.link>
            <a href={ @selected_drone.link } class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mt-3 mx-2">Buy Now</a>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("back", socket) do
    IO.inspect(self(), label: "Back Click")
    {:noreply, assign(socket, selected_drone: nil)}
  end

  def handle_event("more_info", %{"id" => id}, socket) do
    IO.inspect(self(), label: "More Info Click")
    drone = Drones.get_drone!(id)
    {:noreply, assign(socket, selected_drone: drone, page_title: drone.name, show_focused_drone: true)}
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
