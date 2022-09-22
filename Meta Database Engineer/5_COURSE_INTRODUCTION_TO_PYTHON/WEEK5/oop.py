def d():
    color = "green"
    def e():
        nonlocal color
        color = "yellow"
    e()
    print("Color: " + color)
    color = "red"
    print(color)
color = "blue"
d()



#inside d:   
#    local color = "green" inside d
#    inside d there is e :
#    color = "yellow" that set the  line 2 color(local to d non local to e )
#    with nonlocal keyword
#    print(color) is scopre inside d so color is yellow
#    then set to red inside d scope 
#    so now the final color if d scope is red 
# 
# 
# 
# 
#   YOU CAN CHANGE THE VALUE 
#   OF THE VARIABLE IN THE PARENT
#   METHOD FROM INSIDE THE CHILD METHOD 
#   WITH THE KEYWORD : nonlocal  
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 


