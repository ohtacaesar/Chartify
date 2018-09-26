module Highcharts
  class Chart
    attr_accessor :title, :series_list, :x_axis

    def initialize(title)
      @title       = title
      @series_list = []
      @x_axis      = nil
      @y_axis      = [{ title: { text: nil }, opposite: false }]
      @height      = 400
      @categories  = []
    end

    def to_hash
      {
          title:  { text: @title },
          chart:  { height: @height },
          yAxis:  @y_axis,
          series: @series_list.map do |series|
            series.to_hash
          end,
          x: 0,
      }
    end
  end
end