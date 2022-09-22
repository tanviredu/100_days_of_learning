import sys
import math 
from math import sqrt
from math import factorial as f 
import numpy as np

## sys.path retuen all the location
## where your program look for module and files


def getAllThePath():
    paths = sys.path
    c = 1
    for item in paths:
        print(" {} {}".format(c,item))
        c+=1

getAllThePath();