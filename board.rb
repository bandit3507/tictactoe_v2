class Board

    # refactored to accept a size parameter
    def initialize(size)
        # must use Array.new twice or else the each row would point to the same row object
        @board = Array.new(size){Array.new(size, '_' )}
    end

    # no need to refactor
    def valid?(input_position)
        input_position.first < @board.length && input_position.last < @board.length
    end

    # no need to refactor
    def empty?(input_position)
        row = input_position.first
        column = input_position.last
        @board[row][column] == '_'
    end

    # no need to refactor
    def place_mark(position, mark)
        if !valid?(position)
            raise 'Error: invalid position'
        elsif !empty?(position)
            raise 'Error: position is taken'
        else
            row = position.first
            column = position.last
            @board[row][column] = mark
        end
    end

    # refactored to print any size board
    # had to rename method since it had the same name as print column
    def print_board
        @board.each do|row| 
            row.each_with_index do |column, idx|
               if idx == row.length-1
                   print column
               else 
                   print column + " "
               end
            end
            puts
        end
    end

    # refactored to account for any row size
    # incorporated the all? enumerable to check if all columns equaled the mark
    def win_row?(mark)
        @board.any? do |row|
            row.all?{|column| column == mark}
        end
    end

    # no need to refactor
    def win_column?(mark)
        (0..@board.length-1).each do |row|
            win_count = 0
            (0..@board.length-1).each do |column|
                if @board[column][row] == mark
                    win_count += 1
                end
            end
            return true if win_count == 3
        end
        false
    end

    # refactor to account for resizable grid
    def win_diagonal?(mark)
        # left to right diagonal check
        return true if (0..@board.length-1).all? do |index|
            @board[index][index] == mark
        end

        # right to left diagonal check
        return true if (0..@board.length-1).all? do |index|
            row = index
            column = @board.length-1 - index
            @board[row][column] == mark
        end
        false
    end

    # refactored to be more concise
    def win?(mark)
        win_row?(mark) || win_column?(mark) || win_diagonal?(mark)
    end

    # no need to refactor
    def empty_positions?
        (0..@board.length-1).each do |row|
            (0..@board.length-1).each do |column|
                return true if @board[row][column] == '_'
            end
        end
        false
    end
end

