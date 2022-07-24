ranks = {
    0: "2",
    1: "3",
    2: "4",
    3: "5",
    4: "6",
    5: "7",
    6: "8",
    7: "9",
    8: "10",
    9: "Jack",
    10: "Queen",
    11: "King",
    12: "Ace",

}

suits = {
    0: "Clubs",
    1: "Spades",
    2: "Diamonds",
    3: "Hearts"
}

answer = []
card_values = input("Enter cards: ").split()

for case in range(int(input("How many cards: "))):
    suit_value = int(int(card_values[case]) / 13)
    rank_value = int(card_values[case]) % 13
    card = ranks[rank_value] + "-of-" + suits[suit_value]
    print(card, end=" ")
