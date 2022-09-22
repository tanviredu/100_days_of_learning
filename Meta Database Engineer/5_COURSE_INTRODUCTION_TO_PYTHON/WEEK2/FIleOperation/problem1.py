# ## this is not a  good option
# file  = open("test.txt",mode="r")
# data = file.readlines()
# print(data);
# file.close()



# ## this is a better option
# with open("test.txt",mode="r") as file:
#     data = file.readlines()
#     print(data);

with open("newfile.txt",mode = "w") as file:
    data = """lorem ipsum dolor sit amet,consectetur adipiscing elit, sed diam nonumy eirmod tempor invidunt ut labore et dolore """
    file.writelines(data);

with open("newfile.txt",mode = "a") as file:
    data = """lorem ipsum dolor sit amet,consectetur adipiscing elit, sed diam nonumy eirmod tempor invidunt ut labore et dolore """
    file.writelines(data);
with open("newfile.txt",mode = "a") as file:
    data = """lorem ipsum dolor sit amet,consectetur adipiscing elit, sed diam nonumy eirmod tempor invidunt ut labore et dolore """
    file.writelines(data);
with open("newfile.txt",mode = "a") as file:
    data = """lorem ipsum dolor sit amet,consectetur adipiscing elit, sed diam nonumy eirmod tempor invidunt ut labore et dolore """
    file.writelines(data);


try:

    with open("newfile.txt",mode = "r") as file:
        data = file.readlines()
        print(data)
except FileNotFoundError as e:
    print("ERROR",e)



## this will show an error
try:

    with open("neile.txt",mode = "r") as file:
        data = file.readlines()
        print(data)
except FileNotFoundError as e:
    print("ERROR",e)




