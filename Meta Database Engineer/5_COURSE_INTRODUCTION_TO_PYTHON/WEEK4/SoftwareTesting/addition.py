import pytest
from test_addition import Wallet

def test_default_initial_amount():
    obj = Wallet();
    assert obj.balance == 0

def test_initial_amount():
    obj = Wallet(100)
    assert obj.balance == 100

def test_add_cash():
    obj = Wallet(10)
    obj.add_cash(10)
    assert obj.balance == 20

def test_spend_cash():
    obj = Wallet(10)
    obj.add_cash(10)
    obj.spend_cash(10)
    assert obj.balance == 10

def test_insufficient():
    obj = Wallet(10)
    with pytest.raises(Exception):
        obj.spend_cash(20)
    