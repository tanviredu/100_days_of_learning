menu = {
    1: {"name": 'espresso',
        "price": 1.99},
    2: {"name": 'coffee', 
        "price": 2.50},
    3: {"name": 'cake', 
        "price": 2.79},
    4: {"name": 'soup', 
        "price": 4.50},
    5: {"name": 'sandwich',
        "price": 4.99}
}

# loop through and add the  price
prices = []
for index,item in menu.items():
    prices.append(float(item['price']))
total_price = sum(prices)
print(total_price)
tax = round(total_price*0.15,2)
print(tax)

total = round(total_price+tax,2);
print(total)

names = []
for index,item in menu.items():
    names.append(item['name']);
print(names)


