items = [x for x in range(1,51)]
print(items)

def find_even_number(item):
    if(item%2 == 0):
        return item

even_items_with_map = map(find_even_number, items)

## you get the even number with None also
## because map() apply the function to all items individually
## and return every result
for item in even_items_with_map:
    print(item,sep=",")
