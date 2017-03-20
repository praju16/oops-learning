#Advantage of Duck typing. 
#Call mutiple class object methods in single link without knowing the class or action.
# this reduces dependency
#easy to extend
# more abstraction


#disadvantage
# difficult to read and understand

class Trip
  attr_reader :bicycles, :customers, :vehicle
  def prepare(preparers) preparers.each {|preparer|
    preparer.prepare_trip(self)} end
  end
end
# when every preparer is a Duck # that responds to ‘prepare_trip’ class Mechanic
class Mechanic
  def prepare_trip(trip) trip.bicycles.each {|bicycle|
            prepare_bicycle(bicycle)}
  end
end
# ...
class TripCoordinator
  def prepare_trip(trip)

  end
# ...
end
class Driver
  def prepare_trip(trip)
      vehicle = trip.vehicle
      gas_up(vehicle)
      fill_water_tank(vehicle)
  end
# ...
end