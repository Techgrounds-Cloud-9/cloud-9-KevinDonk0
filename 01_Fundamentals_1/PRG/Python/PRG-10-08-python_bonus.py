'''
The output should be:
0
1
2
3
4
8
9
'''
for i in range(10):
	if i < 5:
		print(i)
	elif i >= 8: # changed < to >=
		print(i) # changed break to print(i)
	else:
		continue # changed print(i) to continue