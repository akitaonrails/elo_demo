require "elo_demo/version"
require "elo"
require "faker"

module EloDemo
  class Player
    attr_accessor :name, :games_played, :wins, :loses
    def initialize(options = {})
      self.name = options[:name]
      self.games_played = options[:games_played] || 0
      self.wins = options[:wins] || 0
      self.loses = options[:loses] || 0
    end
  end

  class Tournment
    attr_reader :players

    def initialize
      srand(666)

      @players = []
      10.times do
        @players << Player.new(name: Faker::Name.name)
      end
    end

    def run!
      1000.times do
        player_0 = @players[rand(1..players.size) - 1]
        player_1 = @players[rand(1..players.size) - 1]
        game = [player_0, player_1]
        winner = game[rand(0..1)]
        player_0.games_played += 1
        player_1.games_played += 1
        if player_0.name == winner.name
          player_0.wins += 1
          player_1.loses += 1
        else
          player_0.loses += 1
          player_1.wins += 1
        end
      end
    end

    def ranking
      puts "#{"Name".ljust(40)} - Games - Wins - Loses - Points"
      players.sort_by { |p| p.wins - p.loses }.reverse.each do |p|
        puts "#{p.name.ljust(40)} - #{p.games_played.to_s.rjust(5)} - #{p.wins.to_s.rjust(4)} - #{p.loses.to_s.rjust(5)} - #{(p.wins - p.loses).to_s.rjust(5)}"
      end
    end
  end
end
