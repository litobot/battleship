require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/turn'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Turn do
    it 'exists' do
        turn = Turn.new
        
        expect(turn).to be_a(Turn)
    end
end