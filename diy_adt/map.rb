class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |subarray|
            return nil if subarray[0] == key
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |subarray|
            return subarray[1] if subarray[0] == key
        end
        return nil
    end

    def delete(key)
        @map.each do |subarray|
            if subarray[0] == key
                @map.delete(subarray)
                break
            end
        end
    end

    def show
        @map
    end
end