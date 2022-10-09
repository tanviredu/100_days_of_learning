list1 = []
def work(n):
    list1.append(n)
    cycle = 0
    while n!=1:
        cycle+=1
        if(n%2!=0):
            tmp = 3*n+1;
            #print(tmp)
            list1.append(tmp)
            n = tmp
        else:
            tmp = int(n/2)
            #print(tmp)
            list1.append(tmp)
            n=tmp
    return list1,cycle


number = int(input());
print(work(number))
