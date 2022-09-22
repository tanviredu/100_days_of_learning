


class Employees:
    '''This is The Parent Class '''
    def __init__(self,name,last)->None:
        self.name = name
        self.last = last




# Once you inherited a class
# its attribute will be yours

class Supervisors(Employees):
    '''  This is the child Class'''
    def __init__(self,name,last,password)->None:
        ''' You need to pass the 
        first two data to the 
        parent class if you are willing to use the 
        constructor in the child class'''
        super().__init__(name,last)
        self.password = password


class Chefs(Employees):
    def leave_request(self,days):
        return "I am leaving for "+str(days) +" days"


tanvir = Supervisors("Tanvir","T","password123")
adrian = Employees("Adrian","A")
emily = Chefs("Emily","E")
adam = Chefs("Adam","J")
print(tanvir.password)
print(emily.leave_request(20))
print(adam.leave_request(10))
