triplets = int(raw_input("How many triplets?\n> "))
ans = []

for tri in range(0, triplets):
    trips = raw_input("> ").split()
    order = [int(trips[0]), int(trips[0]), int(trips[0])]

    for n in range(0, 3):

        if int(trips[n]) >= order[0]:
            order[0] = int(trips[n])

        if int(trips[n]) <= order[1]:
            order[1] = int(trips[n])

    for x in range(0, 3):

        if int(trips[x]) < order[0] and int(trips[x]) > order[1]:
            order[2] = int(trips[x])

    ans.append(order[2])

print ' '.join(str(e) for e in ans)
