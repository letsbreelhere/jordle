letters =: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
words =: > (#~ (5&=@>@(# each))) }: each cutLF fread 'scrabble.txt'
possible =: > cutLF fread 'wordles.txt'

NB. Letters are scored by their frequency's nearness to 50%
NB. and duplicates are counted once, since they provide less information.
bestWord =: monad define
  freqs =. (#y) %~ <: #/.~ letters , ,y
  scores =. 0.5 - | 0.5 - freqs
  score =. [: +/ {&scores@(letters&i.)@~.
  {. words \: > score"1 words
)

black =: dyad define
  x #~ -. +./"1 x e."1 y
)

NB. y is given as a pair: letters vs. positions
green =: dyad define
  x #~ */"1 (>{.y) =" 1 (;}.y) {"1 x
)
yellow =: dyad define
  indices =: > (<"1 x i."1 >{. y)
  x #~ (*/"1 indices ~: 5) *. *./"1 indices ~:"1 ;}.y
)

filter =: dyad define
  blacks =. 'B' = >{.x
  yellows =. 'Y' = >{.x
  greens =. 'G' = >{.x
  word =. >{:x
  if. +./blacks do. y =. y black blacks # word end.
  if. +./yellows do. y =. y yellow (word ((yellows#[) ; (yellows#])) i.5) end.
  if. +./greens do. y =. y green (word ((greens#[) ; (greens#])) i.5) end.
  y
)

round =: monad define
  guess =. bestWord y
  echo 'Guess ' , guess , ' and input colors (B/Y/G):'
  colors =. (1!:1) 1
  (1!:2)&2 (colors; guess) filter y
)

play =: {{ round^:(2 < #)^:_ possible }}

NB. Guess is x, correct answer is y
colors =: [: {&'BYG' (= + e.)

worstScore =: dyad define
  scores =. y&colors each <"1 x
  guesses =. > ;&y each scores
  results =. filter&x each <"1 guesses
  >./ > # each results
)

NB. With possible words x and guess y, what colors leave the player with the
NB. most remaining words? (This does not seem to match Absurdle's colors)
worstColor =: dyad define
  scores =. y&colors each <"1 x
  guesses =. > ;&y each scores
  results =. filter&x each <"1 guesses
  worstScore =. >./ > # each results
  y colors (x {~ (>#each results) i. worstScore)
)

NB. Brute force greedy search - given possible answers y, gives the guess which
NB. most restricts the solution, assuming adversarial play.
leastWorstGuess =: {{ words {~ (i. <./) y&worstScore"0 0] words }}
