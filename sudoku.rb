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
      unless square.inject(0){ |sum,x| sum + x } == 45
        valid = false
        break
      end
    end
    valid
  end

  def valid_lines?
    valid = true

    @board.each do |line|
      unless line.inject(0){ |sum,x| sum + x } == 45
        valid = false
        break
      end
    end

    valid
  end

  def valid_columns?
    valid = true

    for i in 0..8
      column = @board.map { |line| line[i] }
      unless column.inject(0){ |sum,x| sum + x } == 45
        valid = false
        break
      end
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
          if squares[i][j] == nil
            squares[i][j] = block
          else
            squares[i][j] = squares[i][j] + block
          end
        end
      end
    end

    squares.flatten(1)
  end
end
