# pure function dont change any value of global variable
# instead they give new value. original input stays intact
# pure function cant add or update or do any change in the global scope
# its work is always local scope

# traditional function can change the value of a global variable
#


## problem add an item to a list 
## traditional way

from ast import Num


numbers = [1, 2, 3]

def traditional_addItem(item):
    numbers.append(item)
    return numbers

## before adding an item to a list
print(numbers)
## adding three item to the global list
traditional_addItem(4)
traditional_addItem(5)
traditional_addItem(6)
# after adding the list
print(numbers)



## doing it with pure function 

num = [1,2,3]

def add_item_pure(lst,item):
    ''' pass the global list with lst parameter
        but do not  do any any operation
        with it . just create a copy 
    '''
    ll = lst.copy()
    ll.append(item)
    return ll

## before adding
print("Before : ",num)

ll1 = add_item_pure(num,4)
ll2 = add_item_pure(ll1,5)
ll3 = add_item_pure(ll2,6)
# print the original list
print("after adding element with pure function");
print(ll3)


print("After ",num);