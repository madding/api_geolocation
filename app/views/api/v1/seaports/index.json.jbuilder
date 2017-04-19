json.seaports @seaports do |seaport|
  json.id seaport.id
  json.name seaport.name
  json.cargos seaport.cargos do |cargo|
    json.name cargo.name
    json.date cargo.date
    json.hold_capacity cargo.hold_capacity
  end
end