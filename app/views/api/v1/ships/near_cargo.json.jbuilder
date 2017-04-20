json.ship do
  json.id @ship.id
  json.name @ship.name
  json.hold_capacity @ship.hold_capacity
  json.cargo do
    json.name @cargo.name
    json.date @cargo.date
    json.hold_capacity @cargo.hold_capacity
    json.seaport do
      json.name @cargo.seaport.name
      json.latitude @cargo.seaport.latitude
      json.longitude @cargo.seaport.longitude
    end
  end
end