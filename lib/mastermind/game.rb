module Mastermind
  class Game
    attr_reader :code, :current_guess, :current_feedback

    Colors = %w{R G Y B W C}

    Pegs = {
      peg_in_place: '*',
      peg_in_code: 'x',
      incorrect_peg: '-'
    }

    def initialize
      @code = self.class.generate_code
      @over = false
    end

    def make_guess(guess)
      @current_guess = guess
      @current_feedback = provide_feedback(guess)
      @over = guess == code
    end

    def over?
      @over
    end

    def self.generate_code
      code = ''
      4.times do
        code += Colors.sample
      end
      code
    end

    private
    def provide_feedback(guess)
      feedback = ''
      guess.split('').each_with_index do |peg, index|
        if code[index] == peg
          feedback += Pegs[:peg_in_place]
        elsif code.include?(peg)
          feedback += Pegs[:peg_in_code]
        else
          feedback += Pegs[:incorrect_peg]
        end
      end
      feedback
    end
  end
end
