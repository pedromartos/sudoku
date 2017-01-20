# frozen_string_literal: true

env = ENV['APPLICATION_ENV'] || 'development'

require 'bundler/setup'
Bundler.require(:default, env.to_sym)

require_relative 'sudoku'

class CodeChallenge
  attr_accessor :boards

  def initialize(input)
    matrix = input.readlines
    matrix.shift

    @boards = []
    matrix.each_slice(9) do |board|
      @boards << board.map { |line| line.split(/\s/).map(&:to_i) }
    end
  end

  def validate_boards
    @boards.each do |board|
      sudoku = Sudoku.new board
      puts sudoku.valid? ? 'Valid' : 'Invalid'
    end
  end
end
