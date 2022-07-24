##function to find the value of a & b
def linear_function(x1, y1, x2, y2):
   a = (y2 - y1)/(x2-x1)
   b = y1 - (a * x1)
   return a, b

##getting the user input
##Placing input into function to find a&b
##putting answer into dictionary
answer = {}
num_of_cases = int(raw_input("How many cases: "))
for n in range(num_of_cases):
    data = raw_input(" ").split()
    data = map(int, data)
    x1, y1, x2, y2 = data

    a, b = linear_function(x1, y1, x2, y2)
    answer[n] = [a, b]

for n in answer:
    print (("(%s)" % answer[n]).translate(None, "[],")),
