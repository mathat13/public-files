def getPuzzleList():
    list1 = []
    list2 = []
    with open ("puzzleinput.txt") as f:
        for line in f.readlines():
            listelements = line.split()
            list1.append(int(listelements[0]))
            list2.append(int(listelements[1]))
        list1.sort()
        list2.sort() 
    return (zip(list1, list2))

def getDistance(number1, number2):
    return abs(number1 - number2)

distance = 0
for numbers in getPuzzleList():
    number1, number2 = numbers
    distance += getDistance(number1, number2)

print(distance)



# for numbers in getNextPair(list1, list2):
# for numbers in [(1,2), (2,10), (3,4)]:
#     number1, number2 = numbers
#     distance += getDistance(number1, number2)
# print(distance)
