json.cargos @cargos do |cargo|
  json.id cargo.id
  json.name cargo.name
  json.hold_capacity cargo.hold_capacity
  json.seaport do
    json.name cargo.seaport.name
    json.latitude cargo.seaport.latitude
    json.longitude cargo.seaport.longitude
  end
end