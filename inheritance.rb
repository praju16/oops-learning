class Bicycle
  attr_reader :chain,:size, :tire_size
  # checking "style" starts down a slippery slope

  def initialize(args)
    @size = args[:size] 
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def post_initialize(args)
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError
  end

  def spares
    { chain: chain ,tire_size: tire_size }.merge(local_spares)
  end

  def local_spares
    {}
  end
  
end


class RoadBicycle < Bicycle
  attr_reader :tape_color,
  
  def post_initialize(args)
    @tape_color = args[:tape_color]
  end


  def default_tire_size
    '23'
  end
  # checking "style" starts down a slippery slope
  def local_spares
    { tape_color: tape_color }   
  end
end

class MountainBicycle < Bicycle
  attr_reader :front_shock, :rear_shock

   def post_initialize(args={})
     @front_shock = front_shock
     @rear_shock = rear_shock
   end

   def default_tire_size
    '10'
   end

   def local_spares
     {rear_shock: rear_shock, front_shock: front_shock}
   end
end

bike = Bicycle.new( style:
              size:
              front_shock:  'Manitou',
              rear_shock:   'Fox')
      bike.spares
      # -> {:tire_size   => "2.1",
      #     :chain       => "10-speed",
      #     :rear_shock  => 'Fox'}