class Passenger
    
    @@all=[]
    def initialize(name)
        @name = name
        @@all<<self
    end

    def name
        @name
    end

    def rides
        Ride.all.select {|ride| ride.passenger == self}
    end

    def drivers
        rides.map do |ride|
            ride.driver
         end
    end

    def total_distance
      total_dis=0.0
       Ride.all.each do |ride|
          if self == ride.passenger
            total_dis=total_dis+ride.distance
          end
      end
         total_dis
    end

    def self.all
        @@all
    end

     def self.premium_members
         result=[]
         Ride.all.map do|ride| 
        puts ride.passenger.total_distance
            if ride.passenger.total_distance > 100
                  result<<ride.passenger.name
            end
         end
         result
     end
end
