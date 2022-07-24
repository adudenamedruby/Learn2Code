# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Find the sum of all the multiples of 3 or 5 below 1000.

total_sum = 0
multiples = []

for num in range(0, 1000):
    if num % 3 == 0 or num % 5 == 0:
        total_sum = total_sum + num
        multiples.append(num)

print multiples
print "The total sum of all these multiples is ", total_sum

