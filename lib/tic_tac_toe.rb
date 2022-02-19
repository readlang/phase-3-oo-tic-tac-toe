require "pry"

class TicTacToe
    attr_accessor :board

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6],
    ]

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
        puts "-----------"
        puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
        puts "-----------"
        puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index(input_string)
        return input_string.to_i - 1
    end

    def move(index, token = "X")
        self.board[index] = token
    end

    def position_taken?(index)
        return self.board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index >= 0 && index <= 8
    end

    def turn_count
        count = 0
        self.board.each {|x| x != " " ? count += 1 : count += 0}
        count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Player  Please make a move by entering a number 1-9" #{current_player}
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            puts "Not a valid move try again... "
            #sleep(2)
            self.turn
        end

    end

    def won?
        #winning_combination_indexes = []
        WIN_COMBINATIONS.each do |x|

            if self.board[x[0]] == self.board[x[1]] && self.board[x[0]] == self.board[x[2]] && self.board[x[0]] != " "
                #p self.board[x[0]]
                #p self.board[x[1]]
                #p self.board[x[2]]
                return x
               
            end
        end
        #winning_combination_indexes == [] ? false : winning_combination_indexes
        false
    end

    def full?
        ! self.board.include? " "     
    end

    def draw?
        self.full? && self.won? == false
    end

    def over?
        #returns true if over, otherwise returns false
        self.won? != false  || self.full?
    end
    
    def winner
        if self.won? == false 
            return nil
        else
            #puts "winner asdf"
            return self.board[self.won?[0]] 
        end
    end

    def play
        until self.over? == true
            self.turn
        end

        if self.won? != false
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    end

end   

new_board = TicTacToe.new
new_board.display_board
#new_board.board = ["X", "X", "X", " ", " ", " ", "O", "O", "O"]
#new_board.play
#binding.pry