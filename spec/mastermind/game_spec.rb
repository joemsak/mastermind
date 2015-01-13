require 'mastermind/game'

RSpec.describe Mastermind::Game do
  it 'can be started' do
    game = described_class.new
    game.start

    expect(game).to be_started
  end

  it 'has a player' do
    game = described_class.new

    expect(game.player).not_to be_nil
  end
end
