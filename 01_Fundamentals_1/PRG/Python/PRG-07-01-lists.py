mylist = [1,2,3,4,5]

for i in range(len(mylist)):
    
    try:
        newlist = mylist[i] + mylist[i+1]
        print(newlist)
    
    except:
        print(mylist[0] + mylist[-1])

