def primes_sieve(limit):
    not_prime = set()
    primes = []

    for i in range(2, limit+1):
        if i in not_prime:
            continue

        for f in range(i*i, limit+1, i):
            not_prime.add(f)

        primes.append(i)

    return primes

primenumbers = primes_sieve(3000000)

print len(primenumbers)

data = map(int, raw_input("Enter data: ").split())

answer = []

for n in data:
    answer.append(primenumbers[n-1])

print ' '.join(str(e) for e in answer)
