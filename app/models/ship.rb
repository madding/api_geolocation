class Ship < ApplicationRecord
  has_many :seaports_ships, class_name: 'SeaportShip'


=begin
  func for distance

function computeDistance (startCoords, destCoords) {
  var startLatRads = degreesToRadians(startCoords.latitude);
  var startLongRads = degreesToRadians(startCoords.longitude);
  var destLatRads = degreesToRadians(destCoords.latitude);
  var destLongRads = degreesToRadians(destCoords.longitude);

  var Radius = 6371; //радиус Земли в километрах
  var distance = Math.acos(Math.sin(startLatRads) * Math.sin(destLatRads) + Math.cos(startLatRads) *
                 Math.cos(destLatRads) * Math.cos(startLongRads - destLongRads)) * Radius;

   return distance;
}

function degreesToRadians (degrees) {
    var radians = (degrees * Math.PI)/180;
    return radians;
}
=end
end
