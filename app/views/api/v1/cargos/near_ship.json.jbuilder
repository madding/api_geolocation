json.cargo do
  json.id @cargo.id
  json.name @cargo.name
  json.date @cargo.date
  json.hold_capacity @cargo.hold_capacity
  json.ship do
    json.name @ship.name
    json.hold_capacity @ship.hold_capacity
    json.seaport do
      json.name @seaport.name
      json.latitude @seaport.latitude
      json.longitude @seaport.longitude
    end
  end
end