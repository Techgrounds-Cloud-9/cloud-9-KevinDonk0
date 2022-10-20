'''
The output should be:
4
16129
'''
def square(x):
	return x**2

foo = 127 # changed location of foo var to earlier position

nr = square(2)
print(nr)

big = square(foo)
print(big)

