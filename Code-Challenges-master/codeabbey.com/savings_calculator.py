def calc(start, finish, rate):
    temp = start
    year = 0
    while True:
        temp = round((temp * rate), 2)
        year += 1
        if temp >= finish:
            break
    return(year)

answer = []

for case in range(int(input("How many cases? > "))):
    start_sum, required_sum, rate = map(int, input("").split())
    rate = float("1." + str(rate).zfill(2))

    answer.append(calc(start_sum, required_sum, rate))

print(' '.join(str(e) for e in answer))
