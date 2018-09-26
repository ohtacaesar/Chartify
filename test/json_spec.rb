require './test/test_helper'
require 'json'

describe JSON do
  describe '#parse' do
    describe 'with wrong type' do
      # JSON::ParseErrr
      it  { JSON.parse('{aaa}') }
    end
  end
end

