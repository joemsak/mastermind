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

  it 'has a codemaster' do
    game = described_class.new
    expect(game.codemaster).not_to be_nil
  end

  it 'starts the game by the codemaster creating a code' do
    game = described_class.new
    game.start
    expect(game.code).not_to be_nil
  end

  it 'takes guesses from the player' do
    game = described_class.new
    player = game.player

    game.start

    player.guess('YGBR')
    player.guess('RBGG')

    expect(game.guesses).to eq(['YGBR', 'RBGG'])
  end

  it 'gives feedback on guesses' do
    game = described_class.new
    player = game.player

    game.start

    player.guess('RGBB')
    player.guess('RGBY')
    expect(game.feedback).to eq(['***-', '****'])
  end
end
