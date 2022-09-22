from abc import ABC,abstractclassmethod, abstractmethod


## this is a abstract class
class Employee(ABC):
    @abstractmethod
    def donate(self):
        pass

class Donation(Employee):
    def donate(self):
        a = input("How Much you want to pay : ")
        return a;

d = Donation()
d.donate();

