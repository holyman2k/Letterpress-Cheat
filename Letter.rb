class Letter
    attr_accessor :value, :count
    def initialize value
        @value = value
        @count = 1
    end
    def increment
        @count += 1
    end

    def to_s
        "letter: #{@value.chr}x#{@count}"
    end
end

