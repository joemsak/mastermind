require 'mastermind/game'

RSpec.describe Mastermind::Game do
  it 'has colored pegs to create a code with' do
    # Red, Green, Yellow, Blue, White, Cyan
    expect(described_class::Colors).to match_array(%w{R G Y B W C})
  end

  it 'generates a 4-digit code from the colors' do
    code = described_class.generate_code
    expect(code.length).to be(4)
  end

  it 'generates the code on start up' do
    allow(described_class).to receive(:generate_code) { 'RYGG' }
    game = described_class.new
    expect(game.code).to eq('RYGG')
  end

  it 'takes guesses' do
    game = described_class.new
    game.make_guess('RYGG')
    expect(game.current_guess).to eq('RYGG')
  end

  it 'provides feedback on the guess' do
    allow(described_class).to receive(:generate_code) { 'RYGG' }
    game = described_class.new

    game.make_guess('RYBG')
    expect(game.current_feedback).to eq('**-*')

    game.make_guess('GRYB')
    expect(game.current_feedback).to eq('xxx-')

    game.make_guess('RYGG')
    expect(game.current_feedback).to eq('****')
  end

  it 'ends the game when the guess matches the code' do
    allow(described_class).to receive(:generate_code) { 'RYGG' }
    game = described_class.new

    game.make_guess('RYGG')
    expect(game).to be_over
  end
end
