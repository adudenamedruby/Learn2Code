user_input = map(int, raw_input("Enter people and step: ").split())

rounds = []
for n in range(0, user_input[0]):
    rounds.append(n+1)

counter = 1
while len(rounds) > 1:
    temp = []
    for n in range(0, len(rounds)):
        if counter == user_input[1]:
            temp.append(n)
            counter = 1
        elif counter < user_input[1]:
            counter += 1
    for n in range(0, len(temp)):
        rounds.pop(temp.pop())

print rounds[0]
