# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

factors = []
prime_factors = []
value = 13195

for num in range(1, value):
    if value % num == 0:
        for i in range(1, (num+1)):
            if num % i == 0 and i < num:
                pass
            elif num % i == 0 and i == num:
                factors.append(num)

print "Prime factors of ", value, " are ", " ".join(str(prime_factors))
print "The largest prime factor is: %s " % prime_factors.pop()
#print largest
