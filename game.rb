require_relative "board.rb"
require_relative "human_player.rb"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    # main game loop
    def play
        if @board.empty_positions?
            @board.print_board
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print_board
                puts "#{@current_player.mark} wins!"
                return
            else
                switch_turn
                play
            end
        else
            puts "It's a draw!"
        end
    end






end

