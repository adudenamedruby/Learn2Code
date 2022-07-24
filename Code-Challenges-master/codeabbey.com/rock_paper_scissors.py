win_conditions = {
    "PS": "S",
    "PR": "P",
    "PP": "D",
    "SP": "S",
    "SR": "R",
    "SS": "D",
    "RS": "R",
    "RP": "P",
    "RR": "D"
    }
answer = []


def count_games(ladder):
    player_one = 0
    player_two = 0
    for each_game in ladder:
        player = determine_game_winner(each_game)
        if player == 1:
            player_one += 1
        elif player == 2:
            player_two += 1
    if player_one > player_two:
        winner = 1
    elif player_one < player_two:
        winner = 2
    else:
        winner = "Draw"
    return(winner)


def determine_game_winner(game, conds=win_conditions):
    game_winner = conds[game]
    if game_winner is "D":
        player = 0
    elif game[0] == game_winner:
        player = 1
    else:
        player = 2
    return(player)

for case in range(int(input("How many cases: "))):
    game_data = input("").split()
    answer.append(count_games(game_data))

print(" ".join(str(e) for e in answer))
