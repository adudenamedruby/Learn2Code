import math

answer = []


def heron(args):
    a, b, c = args
    area = 0.25 * (math.sqrt((4 * a**2 * b**2) - (a**2 + b**2 - c**2)**2))
    return(area)


def find_sides(args):
    x1, y1, x2, y2, x3, y3 = args
    segment1 = math.sqrt((x2-x1)**2 + (y2 - y1)**2)
    segment2 = math.sqrt((x3-x2)**2 + (y3 - y2)**2)
    segment3 = math.sqrt((x3-x1)**2 + (y3 - y1)**2)
    return(segment1, segment2, segment3)


for case in range(int(input("How many cases?\n > "))):
    vertices = map(int, input('').split())
    sides = find_sides(vertices)
    answer.append(heron(sides))

print(' '.join(str(e) for e in answer))
