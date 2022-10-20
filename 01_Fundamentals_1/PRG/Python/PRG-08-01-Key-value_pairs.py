import csv

first_name = input("What is your first name? :")
last_name = input("What is your last name? :")
job_title = input("What is your job title? :")
company = input("What is your company? :")

newdict = {
    "First name" : first_name,
    "Last name" : last_name,
    "job title" : job_title,
    "company" : company
}

# Horizontal output
'''
with open('newfile.csv', 'a') as f:
    w = csv.writer(f)
    w.writerow(newdict.keys())
    w.writerow(newdict.values())
'''

# Vertical output

with open('newfile2.csv', 'a') as f:
    for key in newdict.keys():
        f.write("%s, %s\n" % (key, newdict[key]))


