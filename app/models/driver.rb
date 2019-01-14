class Driver
   
    @@all=[]
    
    def initialize(name)
        @name=name
        @@all<<self
    end

    def name
        @name
    end

    def passenger_names
    result=[]
        Ride.all.map do |ride|
           if ride.driver == self
                result<<ride.passenger.name
           end
        end
        result.uniq
    end

    def rides
        Ride.all.select {|ride| ride.driver == self}
    end

    def self.all
        @@all
    end

    def total_distance
      total_dis=0.0
        Ride.all.each do |ride|
          if ride.driver == self
             total_dis=total_dis+ride.distance
          end
      end
      total_dis
    end

    def self.mileage_cap(distance)
      result=[]
      Ride.all.each do |ride|
          if ride.driver.total_distance > distance
          result<<ride.driver
          end
      end
      result
    end

end