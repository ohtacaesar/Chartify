module Highcharts
  class Series
    attr_reader :name, :data, :data_type, :max, :min, :average

    def initialize(name, data)
      @name      = name
      @type      = :line
      @data      = data
      @visible   = true
      @data_type = nil
      @max       = nil
      @min       = nil
      @average   = nil

      data  = []
      types = {}
      sum   = 0

      @data.each do |value|
        # :string, :number
        type = (Float(value) rescue false) ? :number : :string

        if type == :number
          value = value.to_f
          sum   += value
        end
        data << value

        types[type] ||= 0
        types[type] += 1
      end

      @data = data
      if types[:string]
        @data_type = :string
      elsif types[:number]
        @data_type = :number
        @max       = @data.max
        @min       = @data.min
        @average   = sum / @data.size
      end
    end

    def size
      @data.size
    end

    def to_hash
      {
          name:      @name,
          type:      @type,
          data_type: @data_type,
          visible:   @visible,
          data:      @data,
          yAxis:     0
      }
    end
  end
end
