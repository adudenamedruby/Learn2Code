num_of_num = int(raw_input("How many numbers?\n> "))
ans = []
def dice_roll(number):
    return (int(number * 6) + 1)

for x in range(0, num_of_num):
    value = float(raw_input(" "))
    ans.append(dice_roll(value))

print ' '.join(str(e) for e in ans)
