require "elo_demo/version"
require "elo"
require "faker"

module EloDemo
  class Player
    attr_accessor :name, :games_played, :wins, :loses, :elo_player
    def initialize(options = {})
      self.name = options[:name]
      self.games_played = options[:games_played] || 0
      self.wins = options[:wins] || 0
      self.loses = options[:loses] || 0
      self.elo_player = Elo::Player.new
    end
  end

  class Tournment
    attr_reader :players
    NAMES = %w[Mario Luigi Zelda Bowser Yoshi Wario Fox Pikachu Kong Samus Kirby]

    def initialize
      srand(666)

      @players = []
      10.times do |i|
        @players << Player.new(name: NAMES[i])
      end
    end

    def run!
      1000.times do
        player_0 = @players[rand(1..players.size) - 1]
        player_1 = @players[rand(1..players.size) - 1]
        game = [player_0, player_1]
        winner = game[rand(0..1)]

        if player_0.name == winner.name
          mark_win(player_0, player_1)
        else
          mark_win(player_1, player_0)
        end
      end
    end

    def mark_win(p1, p2)
      p1.games_played += 1
      p2.games_played += 1
      p1.wins += 1
      p2.loses += 1
      p1.elo_player.wins_from(p2.elo_player)
    end

    def print_ranking
      print_naive_ranking
      print_elo_ranking
    end

    def print_naive_ranking
      puts "Ranking sorted by Points (wins - loses)"
      puts "    #{"Name".ljust(10)}  Games  Wins  Loses  Points  Elo Rating"
      players.sort_by { |p| p.wins - p.loses }.reverse.each_with_index do |p, index|
        print_line p, index + 1
      end
      puts ""
    end

    def print_elo_ranking
      puts "Ranking sorted by Elo Rating"
      puts "    #{"Name".ljust(10)}  Games  Wins  Loses  Points  Elo Rating"
      sorted_by_elo.each_with_index do |p, index|
        print_line p, index + 1
      end
      puts ""
    end

    def sorted_by_elo
      players.sort_by { |p| p.elo_player.rating }.reverse
    end

    def print_line(p, index)
      puts "#{index.to_s.rjust(3)} #{p.name.ljust(10)}  #{p.games_played.to_s.rjust(5)}  #{p.wins.to_s.rjust(4)}  #{p.loses.to_s.rjust(5)}  #{(p.wins - p.loses).to_s.rjust(5)}  #{p.elo_player.rating.to_s.rjust(10)}"
    end
  end
end
