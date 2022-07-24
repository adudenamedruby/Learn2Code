## Creating a Fibonacci index list
Fibonacci = [0, 1]
for n in range(2, 1001):
    next_num = Fibonacci[n-1] + Fibonacci[n-2]
    Fibonacci.append(next_num)

##creating a function & variables that cut the number of searches in half
##data_range will be between where the number is
def halving_finder(data, data_range):
    if data <= Fibonacci[data_range[1]/2]:
        data_range = [data_range[0], data_range[1]/2]
        return data_range
    elif data > Fibonacci[data_range[1]/2]:
        data_range = [data_range[1]/2, data_range[1]]
        return data_range

## Getting the input for what numbers we want the indecies for
num_to_process = int(raw_input("Fibonacci numbers to process: "))
data = []
for n in range(0, num_to_process):
    number = long(raw_input(" "))
    data.append(number)

## Figuring out in which section to ignore in the search
## Is the number between 0-500? If not, then only search numbers 500-1000
## Yay efficiency
## After figuring out range, compare small set of numbers to find num index
answer = []
for num in range(0, num_to_process):
    ## narrowing the search range to 125 numbers
    Data_Range = [0, len(Fibonacci)]
    for n in range(0, 3):
        Data_Range = halving_finder(data[num], Data_Range)

    for x in range(Data_Range[0], Data_Range[1]):
        if data[num] == Fibonacci[x]:
            answer.append(x)
            break

print ' '.join(str(e) for e in answer)
