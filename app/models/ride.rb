class Ride

    @@all=[]
    def initialize(driver, passenger, distance)
        @driver=driver
        @passenger=passenger
        @distance=distance
        @@all<<self
    end

    def self.all
      @@all
    end

    def passenger
        @passenger
    end

    def driver
        @driver
    end

    def distance
        @distance
    end

    def self.average_distance
        total_dis=0.0
        @@all.each do |ride|
         total_dis=total_dis+ride.distance
        end
        avg=total_dis/@@all.count
    end

end