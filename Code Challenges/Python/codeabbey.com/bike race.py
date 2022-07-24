def calculation(distance, bike1, bike2):
    dist = bike1 * float(distance) / float(bike1 + bike2)
    return dist

answer = []

for n in range(0,  int(raw_input("How many races: "))):
    distance, bike1, bike2 = map(int, raw_input("").split())
    answer.append(calculation(distance, bike1, bike2))

print ' '.join(str(e) for e in answer)
