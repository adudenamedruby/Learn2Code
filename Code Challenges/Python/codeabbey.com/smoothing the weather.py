m= map(float, raw_input("Enter the measurements:\n").split())
smoothed = list(m)

for n in range(1, len(m)-1):
    smoothed[n] = ((m[n-1] + m[n] + m[n+1]) / 3)

print smoothed
