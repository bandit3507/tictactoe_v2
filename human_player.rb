class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        print "Enter a position as row col: "
        input = gets.chomp
        alphabet = ('a'..'z')
        p input

        if input.split(" ").length > 2 || input.split(" ").length < 2
            raise "You did not enter a number, then a space, and lastly a number"
        end

        first_entry = input.split(" ")[0]
        second_entry = input.split(" ")[1]

        first_entry.each_char {|letter| raise "You entered a letter and not a number " if alphabet.include?(letter)}
        second_entry.each_char {|letter| raise "You entered a letter and not a number " if alphabet.include?(letter)}
        
        return [first_entry.to_i, second_entry.to_i]
    end
end