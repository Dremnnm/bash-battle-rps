# 🪨📄✂️ Bash Battle: Rock, Paper, Scissors!



## How to Run

1. Clone the repository (or download `elias-bash-battle-rps.sh`):

```bash
   git clone https://github.com/Dremnnm/bash-battle-rps.git
   cd bash-battle-rps
   ```

2. Make the script executable (only needed once):

```bash
   chmod +x rps.sh
   ```

3. Run it:

```bash
   ./elias-bash-battle-rps.sh
   ```

## How to Play

* Enter `1`, `2`, or `3` to choose Rock, Paper, or Scissors (you can also type `r`, `p`, `s`, or the full word).
* Enter `Q` at the menu to quit.
* After a round, type `y` to play again or `n` to stop.
* When you quit, the final score is displayed.

## Features Implemented

* Welcome banner and a menu for choosing Rock, Paper, or Scissors
* Random computer choice using `$RANDOM`
* Choices displayed with emojis
* Correct RPS rules
* Fun result messages for outcomes
* Running score for the player and the computer
* Unlimited rounds with a "Go again?" prompt
* Quit option and a final score
* Input validation: invalid input shows a friendly message and asks again instead of crashing

## Bonus Features

* Accepts numbers, single letters, or full words (`1`, `r`, `rock`) in any capitalization
* Tracks ties and total rounds played
* Announces an overall winner in the final summary

## One Thing I Learned

* How '$RANDOM' generates numbers



|File|Description|
|-|-|
|`elias-bash-battle-rps.sh`|The game|
|`README.md`|Project info|



