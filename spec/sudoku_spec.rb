require_relative 'spec_helper'

require_relative  '../sudoku'

describe Sudoku do
  context 'Number of tests' do
    context 'when is valid' do
      it 'success when is greather or equal than 1 and less or equal than 10'
    end

    context 'when is invalid' do
      it 'fail when is less than 1' do
        items = [
          [0],
          [
            [5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5]
          ]
        ]

        expect { Sudoku.new(items) }.to raise_error('Index less than 1')

      end

      it 'fail when is greather than 10' do
        items = [
          [11],
          [5, 3, 4, 6, 7, 8, 9, 1, 2],
          [6, 7, 2, 1, 9, 5, 3, 4, 8],
          [1, 9, 8, 3, 4, 2, 5, 6, 7],
          [8, 5, 9, 7, 6, 1, 4, 2, 3],
          [4, 2, 6, 8, 5, 3, 7, 9, 1],
          [7, 1, 3, 9, 2, 4, 8, 5, 6],
          [9, 6, 1, 5, 3, 7, 2, 8, 4],
          [2, 8, 7, 4, 1, 9, 6, 3, 5],
        ]

        expect { Sudoku.new(items) }.to raise_error('Index greather than 10')
      end
    end
  end

  context 'Validate columns' do
    context 'when number of values is equal to 9' do
      context 'no number repeats on the columns' do
        it 'returns true' do
          items = [
            [1],
            [5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
          ]

          sudoku = Sudoku.new(items)

          expect(sudoku.valid_columns?).to be_truthy
        end
      end

      context 'one or more number are repeated' do
        it 'returns false' do
          items = [
            [1],
            [
              [5, 3, 4, 6, 7, 8, 9, 1, 2],
              [6, 7, 2, 1, 9, 5, 3, 4, 8],
              [1, 9, 8, 3, 4, 2, 5, 6, 7],
              [8, 5, 9, 7, 6, 1, 4, 2, 3],
              [4, 2, 6, 8, 5, 3, 7, 9, 1],
              [7, 1, 3, 9, 2, 4, 8, 5, 6],
              [8, 6, 1, 5, 3, 7, 2, 9, 4],
              [2, 8, 7, 4, 1, 9, 6, 3, 5]
            ]
          ]

          sudoku = Sudoku.new(items)

          expect(sudoku.valid_columns?).to be_falsey
        end
      end
    end
  end

  context 'Validate lines' do
    context 'when number of values is equal to 9' do
      context 'no number repeats on the lines' do
        it 'returns true' do
          items = [
            [1],
            [
              [5, 3, 4, 6, 7, 8, 9, 1, 2],
              [6, 7, 2, 1, 9, 5, 3, 4, 8],
              [1, 9, 8, 3, 4, 2, 5, 6, 7],
              [8, 5, 9, 7, 6, 1, 4, 2, 3],
              [4, 2, 6, 8, 5, 3, 7, 9, 1],
              [7, 1, 3, 9, 2, 4, 8, 5, 6],
              [9, 6, 1, 5, 3, 7, 2, 8, 4],
              [2, 8, 7, 4, 1, 9, 6, 3, 5]
            ]
          ]

          sudoku = Sudoku.new(items)

          expect(sudoku.valid_lines?).to be_truthy
        end
      end

      context 'one or more numbers are repeated' do
        it 'returns false' do
          items = [
            [1],
            [
              [5, 3, 4, 6, 7, 8, 9, 1, 2],
              [6, 7, 2, 1, 9, 5, 3, 4, 8],
              [1, 9, 8, 3, 4, 2, 5, 6, 7],
              [8, 5, 9, 7, 6, 1, 4, 2, 3],
              [4, 2, 6, 8, 5, 3, 7, 9, 1],
              [7, 1, 3, 9, 2, 4, 8, 5, 6],
              [9, 6, 1, 5, 3, 7, 2, 8, 4],
              [2, 8, 3, 4, 1, 9, 6, 3, 5]
            ]
          ]

          sudoku = Sudoku.new(items)

          expect(sudoku.valid_lines?).to be_falsey
        end
      end
    end
  end
end
