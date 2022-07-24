answer = []

# Takes a number and provides the equivalent roll of the dice
def dice_roll(number, dice_sides):
    roll = (number % dice_sides) + 1
    return roll

for n in range(int(raw_input(" >> "))):
    data = map(int, raw_input("").split())
    for e in range(0, len(data)):
        data[e] = dice_roll(data[e], 6)
    answer.append(str(sum(data)))

print ' '.join(answer)
