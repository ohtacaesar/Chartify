require './test/test_helper'
require 'highcharts'

describe Highcharts::Series do
  describe 'with empty data' do
    before do
      @series = Highcharts::Series.new('テストシリーズ', %w())
    end

    # nilでいいのか？
    describe '#type' do
      it { @series.type.must_equal(nil) }
    end
  end

  describe 'initialized' do
    before do
      @series = Highcharts::Series.new('テストシリーズ', %w(0 1 2 3 4 5 6))
    end

    describe '#type' do
      it { @series.type.must_equal(:number) }
    end

    describe '#size' do
      it { @series.size.must_equal(7) }
    end

    describe '#max' do
      it { @series.max.must_equal(6) }
    end

    describe '#min' do
      it { @series.min.must_equal(0) }
    end

    describe '#average' do
      it { @series.average.must_equal(3) }
    end

    describe '#to_hash' do
      it { @series.to_hash.must_equal({ name: 'テストシリーズ', data: [0, 1, 2, 3, 4, 5, 6] }) }
    end
  end
end