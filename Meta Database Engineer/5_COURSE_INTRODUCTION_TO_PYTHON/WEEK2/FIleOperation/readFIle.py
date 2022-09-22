

## read function will read the rntire file no matter what it is

def readFileWholeContent(filepath):
    with open(filepath,'r') as file:
        data = file.read()
    
    print(data)

#readFileWholeContent("newfile.txt")

## read line with print only the first line of the text file
def readFirstLine(filepath):
    with open(filepath,'r') as file:
        data = file.readline()
    print(data)

readFirstLine("newfile.txt")



## readLines witll take evert new line as a list element 
## readlines return the list of that paragraph every line is a list element

def readAndList(filepath):
    with open(filepath,'r') as file:
        data = file.readlines();
    return data

lines = readAndList("newfile.txt")

print("Total Line "+str(lines.__len__()))
i = 1
for item in lines:
    print("{}.  {}".format(i, item))
    i+=1
