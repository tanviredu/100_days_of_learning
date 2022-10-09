#a = 12
#llst = []
#for item in range(1,12):
#    if a%item == 0:
#        llst.append(item)

#print(llst)

def commonFactors(a,b):
    llst1 = []
    for item in range(1,a+1):
        if a%item == 0:
            llst1.append(item)
    print(llst1)
    llst2 = []
    for item in range(1,b+1):
        if b%item == 0:
            llst2.append(item)
    print(llst2)
    z = set(llst1).intersection(set(llst2))
    print(z.__len__())

commonFactors(12,6)
