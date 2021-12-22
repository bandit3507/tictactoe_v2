class Board

    def initialize
        @board = Array.new(3){['_', '_', '_']}
    end

    def valid?(input_position)
        input_position.first < @board.length && input_position.last < @board.length
    end

    def empty?(input_position)
        row = input_position.first
        column = input_position.last
        @board[row][column] == '_'
    end

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

    def print
        @board.each{|row| puts row[0] + " " + row[1] + " " + row[2]}
    end

    def win_row?(mark)
        @board.any? do |row|
            row[0]==mark && row[1]==mark && row[2]==mark
        end
    end

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

    def win_diagonal?(mark)
        if @board[0][0] == mark && @board[1][1] == mark && @board[2][2] == mark
            return true
        elsif @board[0][2] == mark && @board[1][1] == mark && @board[2][0] == mark
            return true
        end
        false
    end

    def win?(mark)
        return true if win_row?(mark)
        return true if win_column?(mark)
        return true if win_diagonal?(mark)
    end

    def empty_positions?
        (0..@board.length-1).each do |row|
            (0..@board.length-1).each do |column|
                return true if @board[row][column] == '_'
            end
        end
        false
    end


end







