# Elo Rating Demonstration

Most people do ranking wrong. In this small demonstration I have 10 players battling each other through 1,000 random matches.

The most naive sorting would be to create a simple score (such as number of wins subtracted by number of loses). In this case, this is the simple ranking:

```
Ranking sorted by Points (wins - loses)
    Name        Games  Wins  Loses  Points  Elo Rating
  1 Kong          217   117    100     17         802
  2 Samus         211   110    101      9         842
  3 Wario         197   102     95      7         824
  4 Luigi         186    95     91      4         841
  5 Zelda         160    81     79      2         847
  6 Pikachu       209   105    104      1         851
  7 Yoshi         223   112    111      1         803
  8 Mario         203   101    102     -1         820
  9 Fox           208    95    113    -18         754
 10 Bowser        186    82    104    -22         785
```

Now we make Samus (2nd) wins from Wario (3rd) 10 times in a row, without no one else battling this time.

```
Ranking sorted by Points (wins - loses)
    Name        Games  Wins  Loses  Points  Elo Rating
  1 Samus         221   120    101     19         896
  2 Kong          217   117    100     17         802
  3 Luigi         186    95     91      4         841
  4 Zelda         160    81     79      2         847
  5 Pikachu       209   105    104      1         851
  6 Yoshi         223   112    111      1         803
  7 Mario         203   101    102     -1         820
  8 Wario         207   102    105     -3         760
  9 Fox           208    95    113    -18         754
 10 Bowser        186    82    104    -22         785
```

You can see that Samus went to the top of the ranking while poor Wario drastically dropped from 3rd to 8th place.

This is very unfair as Wario was already weaker than then Samus so the odds of him winning were not high to begin with, and the penalty of trying against a stronger opponent made him drop a lot in the ranking.

Let's try to make Kong (2nd) losing to Bowser (10th) 10 times.

```
Ranking sorted by Points (wins - loses)
    Name        Games  Wins  Loses  Points  Elo Rating
  1 Samus         221   120    101     19         896
  2 Kong          227   117    110      7         732
  3 Luigi         186    95     91      4         841
  4 Zelda         160    81     79      2         847
  5 Pikachu       209   105    104      1         851
  6 Yoshi         223   112    111      1         803
  7 Mario         203   101    102     -1         820
  8 Wario         207   102    105     -3         760
  9 Bowser        196    92    104    -12         845
 10 Fox           208    95    113    -18         754
```

Now even though Kong was supposed to have better odds for being stronger, he lost 10 times in a row but he's still at 2nd place.

And Bowser, who performed an impressive winning streak of 10 wins agains the 2nd most stronger, still only jumped up one position in the ranking, to 9th place.

Again, this is very unfair. And this is why simple counting methods such as absolute ammout of wins and loses are not used in real rankings.


## Elo Rating Run

Starting over with the exact 1,000 matches in the exact same order and win x lose scenario, we already arrive to a very different ranking than the first one:

In the naive system, the current top player Pikachu was only in 6th, and Kong, who is at 8th here was considered the top player.

```
Ranking sorted by Elo Rating
    Name        Games  Wins  Loses  Points  Elo Rating
  1 Pikachu       209   105    104      1         851
  2 Zelda         160    81     79      2         847
  3 Samus         211   110    101      9         842
  4 Luigi         186    95     91      4         841
  5 Wario         197   102     95      7         824
  6 Mario         203   101    102     -1         820
  7 Yoshi         223   112    111      1         803
  8 Kong          217   117    100     17         802
  9 Bowser        186    82    104    -22         785
 10 Fox           208    95    113    -18         754
```

Now let's make Zelda (2nd) win from Samus (3rd) 10 times.

They are almost evenly matched (almost same level in the ranking), so Zelda jumps to 1st place and Samus drops from 3rd to 9th.

```
Ranking sorted by Elo Rating
    Name        Games  Wins  Loses  Points  Elo Rating
  1 Zelda         170    91     79     12         904
  2 Pikachu       209   105    104      1         851
  3 Luigi         186    95     91      4         841
  4 Wario         197   102     95      7         824
  5 Mario         203   101    102     -1         820
  6 Yoshi         223   112    111      1         803
  7 Kong          217   117    100     17         802
  8 Bowser        186    82    104    -22         785
  9 Samus         221   110    111     -1         775
 10 Fox           208    95    113    -18         754
```

Now let's try the improbable scenario of Pikachu (2nd) losing to Fox (10th) 10 times.

```
Ranking sorted by Elo Rating
    Name        Games  Wins  Loses  Points  Elo Rating
  1 Zelda         170    91     79     12         904
  2 Luigi         186    95     91      4         841
  3 Fox           218   105    113     -8         829
  4 Wario         197   102     95      7         824
  5 Mario         203   101    102     -1         820
  6 Yoshi         223   112    111      1         803
  7 Kong          217   117    100     17         802
  8 Bowser        186    82    104    -22         785
  9 Samus         221   110    111     -1         775
 10 Pikachu       219   105    114     -9         766
```

They almost swapped positions because by the skill reflected in the ranking, Pikachu had a higher probability of winning against a 'weak' opponent such as Fox.

But instead, Fox did an impressive winning streak, so he deserved jumping up from 10th to 3rd, and Pikachu suffered a severe penalty of dropping from 3rd to 10th for losing so many times.

This is a much fair system where we use the probability of wins and loses.

If a strong player does a match against a weaker player, he shouldn't jump up too much in the ranking while the weaker shouldn't drop down so much from the ranking, as it's all expected outcomes.

Now, in the case of improbable matches where a stronger player loses against a weaker player, the stronger should drop down a lot more and the weaker should jump up a lot more as reward.

This motivates the stronger player to play their best to stay up and the weaker to risk against stronger opponents to wield better rewards.

That's what makes a more competitive environment for players.

## Installation

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install elo_demo

## Usage

Just execute the scenario runner:

    $ bin/run_demo

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/akitaonrails/elo_demo.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

