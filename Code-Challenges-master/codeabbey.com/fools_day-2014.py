for case in range(int(input("How many cases: "))):
    data = input("").split()
    data = map(int, data)
    total = 0
    for number in data:
        total = total + (number * number)
    print(total, end=" ")