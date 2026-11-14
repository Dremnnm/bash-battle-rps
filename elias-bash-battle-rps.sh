player_score=0
computer_score=0
ties=0
rounds=0

show_banner() {
    echo "================================"
    echo "  🪨📄✂️  BASH BATTLE!  ✂️📄🪨"
    echo "================================"
    echo
}

choice_name() {
    case "$1" in
        1) echo "🪨 Rock" ;;
        2) echo "📄 Paper" ;;
        3) echo "✂️  Scissors" ;;
    esac
}

get_player_choice() {
    while true; do
        echo "Choose your weapon!"
        echo
        echo "1) Rock"
        echo "2) Paper"
        echo "3) Scissors"
        echo "Q) Flee"
        echo
        read -r -p "Your choice: " input

        input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

        case "$input" in
            1|r|rock)       player_choice=1; return ;;
            2|p|paper)      player_choice=2; return ;;
            3|s|scissors)   player_choice=3; return ;;
            q|quit)         player_choice="q"; return ;;
            *)
                echo
                echo "❌ \"$input\" Won't serve as a weapon. Please pick 1, 2, 3, or Q (flee)."
                echo
                ;;
        esac
    done
}

get_computer_choice() {
    computer_choice=$(( RANDOM % 3 + 1 ))
}

determine_winner() {
    echo
    echo "You chose:      $(choice_name "$player_choice")"
    echo "🤖I chose: $(choice_name "$computer_choice")"
    echo

    rounds=$(( rounds + 1 ))

    if [ "$player_choice" -eq "$computer_choice" ]; then
        # Same choice = tie
        echo "🤝 GREAT MINDS THINK ALIKE!"
        echo "😐 IT'S A TIE!"
        ties=$(( ties + 1 ))

    elif [ "$player_choice" -eq 1 ] && [ "$computer_choice" -eq 3 ]; then
        echo "💥 ROCK CRUSHES SCISSORS!"
        player_wins

    elif [ "$player_choice" -eq 3 ] && [ "$computer_choice" -eq 2 ]; then
        echo "✂️  SCISSORS CUT PAPER!"
        player_wins

    elif [ "$player_choice" -eq 2 ] && [ "$computer_choice" -eq 1 ]; then
        echo "📄 PAPER COVERS ROCK!"
        player_wins

    else
        case "$computer_choice" in
            1) echo "💥 ROCK CRUSHES SCISSORS!" ;;
            2) echo "📄 PAPER COVERS ROCK!" ;;
            3) echo "✂️  SCISSORS CUT PAPER!" ;;
        esac
        echo "🤖 THIS IS MY PERFECT VICTORY, I WIN!"
        computer_score=$(( computer_score + 1 ))
    fi
}

player_wins() {
    echo "🏆 FINE.. YOU WIN!"
    player_score=$(( player_score + 1 ))
}

show_score() {
    echo
    echo "Score:"
    echo "You: $player_score"
    echo "🤖 Me: $computer_score"
    echo
}

play_again() {
    while true; do
        read -r -p "Go again? (y/n): " answer
        answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')
        case "$answer" in
            y|yes) echo; return 0 ;;
            n|no|q|quit) return 1 ;;
            *) echo "Please type y or n." ;;
        esac
    done
}

show_final_score() {
    echo
    echo "================================"
    echo "         🏁 FINAL SCORE 🏁"
    echo "================================"
    echo "Rounds played: $rounds"
    echo "You:           $player_score"
    echo " 🤖 Me:      $computer_score"
    echo "Ties:          $ties"
    echo

    if [ "$player_score" -gt "$computer_score" ]; then
        echo "🎉 YOU BEAT ME!? Champion of the terminal!"
    elif [ "$player_score" -lt "$computer_score" ]; then
        echo "🤖 I WIN AGAIN. Rematch soon?"
    else
        echo "⚖️  IT'S A DRAW OVERALL. Well fought!"
    fi
    echo
    echo "This was invigorating! 👋"
}

# main program

show_banner

while true; do
    get_player_choice

    if [ "$player_choice" = "q" ]; then
        break
    fi

    get_computer_choice
    determine_winner
    show_score

    if ! play_again; then
        break
    fi
done

show_final_score