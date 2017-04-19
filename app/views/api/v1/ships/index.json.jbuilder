json.ships @ships do |ship|
  json.id ship.id
  json.name ship.name
  json.hold_capacity ship.hold_capacity
  json.seaports ship.seaports_ships do |seaport_ship|
    json.name seaport_ship.seaport.name
    json.date seaport_ship.date
  end
end