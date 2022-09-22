
class PaySlip:

    def __init__(self,name: str,payment:str,amount:int) -> None:
        self.name = name
        self.payment = payment
        self.amount = amount

    def Pay(self):
        self.payment = "yes"

    def Status(self)-> str:
        if self.payment == "yes":
            return self.name + " is Paid "+str(self.amount)
        else:
            return self.name + " is not Paid"
nathan = PaySlip("Nathan","no",100)
bob = PaySlip("Bob","yes",200)

print(nathan.Status())
print(bob.Status())
nathan.Pay()
print(nathan.Status())

