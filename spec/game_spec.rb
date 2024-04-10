require 'spec_helper'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Game do
    describe '#initialize' do
        it 'is an instance of Game' do
        game = Game.new

        expect(game).to be_an_instance_of(Game)
        end
    end

    describe '#placement' do
        it 'cpu places the cruiser and submarine on the board' do
            game = Game.new
            game.cpu_placement
            cruiser_coords = game.cpu_cruiser_location
            submarine_coords = game.cpu_submarine_location

            expect(cruiser_coords.length).to eq(3)
            expect(submarine_coords.length).to eq(2)

            all_coords = cruiser_coords + submarine_coords
            expect(all_coords.uniq.length).to eq(all_coords.length)
        end
    end
end