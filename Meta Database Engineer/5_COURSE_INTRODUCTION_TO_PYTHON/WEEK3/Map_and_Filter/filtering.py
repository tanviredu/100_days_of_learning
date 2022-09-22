items = [x for x in range(1,51)]
print(items)

def find_even_number(item):
    if item % 2 == 0:
        return item

filtered_data = filter(find_even_number,items)



## it wont retuen any None value like map because
## it returns only the value which are Came true after applying the function
for item in filtered_data:
    print(item,sep=",")