class House:
    ''' Difference Between CLass Method 
        and instance method
    '''
    num_rooms = 5
    batchrooms = 2
    def __init__(self):
        pass

    def cost_evaluation(self,rate):
        '''Functionality to calculate the cist of the room '''
        cost = rate*self.num_rooms
        return cost


house = House();
house.num_rooms = 100;
print(house.num_rooms)
print(House.num_rooms);
House.num_rooms = 200;
print(House.num_rooms)

