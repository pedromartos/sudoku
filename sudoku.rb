# frozen_string_literal: true

env = ENV['APPLICATION_ENV'] || 'development'

require 'bundler/setup'
Bundler.require(:default, env.to_sym)

class Sudoku
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def valid?
    valid_squares? and valid_lines? and valid_columns?
  end

  def valid_squares?
    valid = true
    squares = board_to_squares

    squares.each do |square|
      valid = valid_item?(square)
      break unless valid
    end

    valid
  end

  def valid_lines?
    valid = true

    @board.each do |line|
      valid = valid_item?(line)
      break unless valid
    end

    valid
  end

  def valid_columns?
    valid = true

    (0..8).each do |i|
      column  = @board.map { |line| line[i] }
      valid   = valid_item?(column)
      break unless valid
    end

    valid
  end

  private

  def board_to_squares
    squares = []

    @board.each_slice(3).with_index do |group, i|
      squares[i] = []
      group.each do |line|
        line.each_slice(3).with_index do |block, j|
          squares[i][j] = squares[i][j].nil? ? block : squares[i][j] + block
        end
      end
    end

    squares.flatten(1)
  end

  def valid_item?(item)
    obj = item.flatten

    obj.inject(0) { |sum, x| sum + x } == 45
  end
end
