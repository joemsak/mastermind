require 'mastermind/game'

RSpec.describe Mastermind::Game do
  it 'has 5 colors to pick from' do
    expect(described_class.colors).to match_array(%w{R G Y B W})
  end

  it 'starts with a generated code from the colors' do
    allow(described_class).to receive(:generate_code) { 'RGYB' }
    game = described_class.new
    expect(game.code).to eq('RGYB')
  end

  it 'takes a guess from the player' do
    game = described_class.new

    game.make_guess('RGYB')
    game.make_guess('RRGB')

    expect(game.guesses).to eq(['RGYB', 'RRGB'])
  end

  it 'returns feedback on each guess' do
    allow(described_class).to receive(:generate_code) { 'RGGB' }
    game = described_class.new

    game.make_guess('RBGG') # *x*x
    game.make_guess('BYYG') # x--x
    game.make_guess('RGGB') # ****

    expect(game.feedback).to eq(['*x*x', 'x--x', '****'])
  end

  it 'ends the game on the correct guess' do
    allow(described_class).to receive(:generate_code) { 'WYGB' }

    game = described_class.new

    game.make_guess('WYGB')

    expect(game).to be_over
  end
end
