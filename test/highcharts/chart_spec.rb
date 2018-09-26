require './test/test_helper'
require 'highcharts'

describe Highcharts::Chart do

  describe 'with no series' do
    before do
      @chart = Highcharts::Chart.new('テストチャート')
    end

    describe '#title' do
      it { @chart.title.must_equal('テストチャート') }
    end

    describe '#to_hash' do
      it do
        @chart.to_hash.must_equal(
            {
                title:  { text: 'テストチャート' },
                chart:  { height: 500 },
                series: []
            }
        )
      end
    end
  end

end