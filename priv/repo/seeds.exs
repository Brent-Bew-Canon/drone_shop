# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DroneShop.Repo.insert!(%DroneShop.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias DroneShop.Repo
alias DroneShop.Drones.Drone

%Drone{
  name: "Mavic 3 Pro",
  model: "Mavic 3 Pro",
  price: "$$$",
  cost: "$1600",
  type: "Cinematic",
  image: "/images/drones/mavic-3-pro.jpg",
  description:
    "Capture different visual expressions of the same subject. The 24mm Hasselblad camera is suitable for shooting large-scale scenes. Create a sense of space and story with the 70mm medium tele camera. Punch in with the 166mm tele camera to bring the subject into focus. Simply tap the display to easily and quickly switch between different focal lengths.",
  sensor: "4/3 CMOS Hasselblad Camera",
  flight_time: "46 min",
  link: "https://store.dji.com/product/dji-mavic-3-classic?gad=1&gclid=CjwKCAjwo9unBhBTEiwAipC112rwClNPK8mGxKPgkVLLHbOsYJ57m4WqN--QSbQuR28AoVRqu5XufBoCDfQQAvD_BwE&vid=125091"
}
|> Repo.insert!()

%Drone{
  name: "Mavic 3 Classic",
  model: "Mavic 3 Classic",
  price: "$$$",
  cost: "$1600",
  type: "Cinematic",
  image: "/images/drones/mavic-3-classic.jpg",
  description:
    "With powerful flight performance and a Hasselblad camera, Mavic 3 Classic delivers the absolute essence of flagship imaging. Take it on any adventure to create unforgettable work.",
  sensor: "4/3 CMOS Hasselblad Camera",
  flight_time: "46 min",
  link: "https://store.dji.com/product/dji-mavic-3-classic?gad=1&gclid=CjwKCAjwo9unBhBTEiwAipC112rwClNPK8mGxKPgkVLLHbOsYJ57m4WqN--QSbQuR28AoVRqu5XufBoCDfQQAvD_BwE&vid=125091"
}
|> Repo.insert!()

%Drone{
  name: "DJI Air 3",
  model: "DJI Air 3",
  price: "$$",
  cost: "$1200",
  type: "Cinematic",
  image: "/images/drones/dji-air-3.jpg",
  description:
    "DJI Air 3 is a compact foldable drone with two powerful cameras— a wide-angle and a 3x medium telephoto. Enjoy optimized flights with a 46-minute max flight time, [1] omnidirectional obstacle sensing, [2] and O4 HD video transmission. And capture breathtaking details of any scene with dual-camera 48MP photos and 4K HDR video. With Air 3, film your subjects with unlimited creativity and tell a bold visual story.",
  sensor: "4/3 CMOS Hasselblad Camera",
  flight_time: "46 min",
  link: "https://store.dji.com/product/dji-mavic-3-classic?gad=1&gclid=CjwKCAjwo9unBhBTEiwAipC112rwClNPK8mGxKPgkVLLHbOsYJ57m4WqN--QSbQuR28AoVRqu5XufBoCDfQQAvD_BwE&vid=125091"
}
|> Repo.insert!()

%Drone{
  model: "DJI Avata",
  price: "$$",
  cost: "$1100",
  type: "FPV",
  image: "/images/drones/dji-avata.jpg",
  description:
    "Compact and lightweight, DJI Avata is nimble in tight spaces. Every aspect of its design was made for you to be bold. The built-in propeller guard means that if Avata comes in contact with an object, it can bounce back, stay in the air, and can keep on flying.",
  sensor: "4/3 CMOS Hasselblad Camera",
  flight_time: "46 min",
  link: "https://store.dji.com/product/dji-mavic-3-classic?gad=1&gclid=CjwKCAjwo9unBhBTEiwAipC112rwClNPK8mGxKPgkVLLHbOsYJ57m4WqN--QSbQuR28AoVRqu5XufBoCDfQQAvD_BwE&vid=125091"
}
|> Repo.insert!()

%Drone{
  name: "DJI FPV",
  model: "DJI FPV",
  price: "$$",
  cost: "$1000",
  type: "FPV",
  image: "/images/drones/dji-fpv.jpg",
  description:
    "DJI FPV is a groundbreaking ready-to-fly FPV drone that lets users of any skill level feel the thrill of immersive flight. Features like an intuitive Motion Controller, 4K/60fps video, a 150° super-wide FOV, 10km image transmission, and 28ms low latency deliver a truly unrivaled aerial experience.",
  sensor: "4/3 CMOS Hasselblad Camera",
  flight_time: "46 min",
  link: "https://store.dji.com/product/dji-mavic-3-classic?gad=1&gclid=CjwKCAjwo9unBhBTEiwAipC112rwClNPK8mGxKPgkVLLHbOsYJ57m4WqN--QSbQuR28AoVRqu5XufBoCDfQQAvD_BwE&vid=125091"
}
|> Repo.insert!()

%Drone{
  name: "DJI Mini 3",
  model: "DJI Mini 3",
  price: "$",
  cost: "$800",
  type: "Cinematic",
  image: "/images/drones/dji-mini-3.jpg",
  description:
    "DJI Mini 3 is a compact, ultra-lightweight camera drone built for adventure. It features extended battery life, detail-rich 4K HDR video, and fun features like True Vertical Shooting for social-media-optimized shots. Whether you're capturing an epic road trip, or just a day in your own backyard, Mini 3 is up for the moment.",
  sensor: "4/3 CMOS Hasselblad Camera",
  flight_time: "46 min",
  link: "https://store.dji.com/product/dji-mavic-3-classic?gad=1&gclid=CjwKCAjwo9unBhBTEiwAipC112rwClNPK8mGxKPgkVLLHbOsYJ57m4WqN--QSbQuR28AoVRqu5XufBoCDfQQAvD_BwE&vid=125091"
}
|> Repo.insert!()
