module Highcharts
  class Builder
    attr_accessor :title

    def initialize
      @title = nil
    end

    def build(csv)
      map  = {}
      data = {}

      header = csv.readline
      if header == nil
        raise 'no data'
      end

      header.each_with_index do |field, index|
        map[index]  = field
        data[index] = []
      end

      csv.readlines.each_with_index do |line, line_number|
        map.keys.each do |key|
          if (value = line[key]) && data[key]
            data[key] << value
          else
            data.delete(key)
          end
        end
      end

      series_list = []
      map.each do |index, field|
        series_list << Series.new(field, data[index])
      end

      chart             = Chart.new(@title)
      chart.series_list = series_list

      chart
    end
  end
end