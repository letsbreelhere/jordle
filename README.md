# JORDLE

Cheating at Wordle, in J. Written as J exercise. Not the greatest algorithm, but
it solves in 3.5 guesses or so. The goal is to provide a guess that gets close to
halving the remaining wordlist per round.

To play, open `world.ijs` in a J console and run `play''`.

<details>
<summary>Sample game</summary>

```
> jcon wordle.ijs
   play''
Guess OATER and input colors (B/Y/G):
BBYYB
BEFIT
BEGET
BESET
CHEST
CHUTE
CLEFT
DEBIT
DEBUT
DEITY
DEPTH
DWELT
EDICT
EIGHT
EJECT
ELECT
ELITE
EMPTY
ETHIC
ETUDE
EVENT
EVICT
EXIST
EXULT
FLEET
FLUTE
GUEST
HEFTY
HEIST
INEPT
KNELT
LEFTY
PIETY
QUEST
QUITE
SCENT
SHEET
SLEET
SLEPT
SMELT
SMITE
SPELT
SPENT
SPITE
STEED
STEEL
STEEP
STEIN
STYLE
SUITE
SWEET
SWEPT
TEDDY
TEETH
TENET
TENSE
TENTH
TEPEE
TEPID
TESTY
THEFT
THEME
THESE
THYME
TILDE
TITHE
TITLE
TULLE
TWEED
TWEET
TWICE
TWINE
UNITE
UTILE
WHITE
ZESTY
Guess HILUS and input colors (B/Y/G):
BBBBB
BEGET
EJECT
EMPTY
EVENT
TEDDY
TENET
TEPEE
TWEED
TWEET
Guess DOWNY and input colors (B/Y/G):
BBBBB
BEGET
EJECT
TEPEE
Guess PUBCO and input colors (B/Y/G):
BBBGB
EJECT
EJECT
<end>
```
</details>
