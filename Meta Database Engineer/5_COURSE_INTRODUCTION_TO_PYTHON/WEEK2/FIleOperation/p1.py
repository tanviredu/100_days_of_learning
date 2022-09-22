def read_file(file_name):
    with open(file_name,'r') as file:
        lines = file.read()
    print(lines)
    return lines

def read_file_into_list(file_name):
   
    with open(file_name, 'r') as file:
        data = file.readlines()
    return data
    
    
   
def write_first_line_to_file(file_contents, output_filename):
    
    line = file_contents.split('\n')[0]
    with open(output_filename,'w') as output:
        output.write(line);

def read_even_numbered_lines(file_name):
    ### WRITE SOLUTION HERE
    with open(file_name,'r') as file:
        lines = file.readlines()
        ll=[]
        c = 1
        for item in lines:
            if c%2==0 :
                ll.append(item)
            c+=1
        return ll 


    #raise NotImplementedError()

def read_file_in_reverse(file_name):
    with open(file_name,'r') as file:
        lines = file.readlines()
    rvlines = lines[::-1]
    print(rvlines)
    return rvlines

    #raise NotImplementedError()

'''
Here are some sample commands to help you run/test your implementations.
Feel free to uncomment/modify/add to them as you wish.
'''
def main():
    file_contents = read_file("sampletext.txt")
    #print(file_contents)
    #print(read_file_into_list("sampletext.txt"))
    #write_first_line_to_file(file_contents, "online.txt")
    #print(read_even_numbered_lines("sampletext.txt"))
    #print(read_file_in_reverse("sampletext.txt"))

if __name__ == "__main__":
    main()