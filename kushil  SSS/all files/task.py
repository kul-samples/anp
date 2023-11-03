
min="""
import csv

# Read the data from the CSV file
with open('C:/Users/SSS2022259/OneDrive/Desktop/File2py.csv', 'r', encoding='utf-8') as file:
    reader = csv.reader(file)
    data = list(reader)

# Extract the column headers
headers = data[0]

# Extract the salary column and corresponding records from the data
salaries = [(float(row[3]), row) for row in data[1:]]

# Sort the salaries in descending order
salaries.sort(reverse=False)

# Select the top three maximum salaries
filtered_salaries = salaries[:3]

# Calculate the spacing for formatting
header_spacing = 15
value_spacing = 15

# Format and print the column headers
formatted_headers = [header.ljust(header_spacing) for header in headers]
print(''.join(formatted_headers))
print('-------------------------------------------------------------------------')


# Output the filtered salary details in tabular format
for salary, record in filtered_salaries:
    formatted_values = [str(item).ljust(value_spacing) for item in record]
    print(''.join(formatted_values))
"""


max="""
import csv

# Read the data from the CSV file
with open('C:/Users/SSS2022259/OneDrive/Desktop/File2py.csv', 'r', encoding='utf-8') as file:
    reader = csv.reader(file)
    data = list(reader)

# Extract the column headers
headers = data[0]

# Extract the salary column and corresponding records from the data
salaries = [(float(row[3]), row) for row in data[1:]]

# Sort the salaries in descending order
# salaries.sort(reverse=True)

# Select the top three maximum salaries
filtered_salaries = salaries[:3]

# Calculate the spacing for formatting
header_spacing = 15
value_spacing = 15

# Format and print the column headers
formatted_headers = [header.ljust(header_spacing) for header in headers]
print(''.join(formatted_headers))
print('-------------------------------------------------------------------------')


# Output the filtered salary details in tabular format
for salary, record in filtered_salaries:
    formatted_values = [str(item).ljust(value_spacing) for item in record]
    print(''.join(formatted_values))
"""


full="""
import csv

# Read the data from the CSV file
with open('C:/Users/SSS2022259/OneDrive/Desktop/File2py.csv', 'r', encoding='utf-8') as file:
    reader = csv.reader(file)
    data = list(reader)

# Extract the column headers
headers = data[0]

# Extract the salary column and corresponding records from the data
salaries = [(float(row[3]), row) for row in data[1:]]

# Sort the salaries in descending order
salaries.sort(reverse=True)

# Select the top three maximum salaries
filtered_salaries = salaries[:-1]

# Calculate the spacing for formatting
header_spacing = 15
value_spacing = 15

# Format and print the column headers
formatted_headers = [header.ljust(header_spacing) for header in headers]
print(''.join(formatted_headers))
print('-------------------------------------------------------------------------')


# Output the filtered salary details in tabular format
for salary, record in filtered_salaries:
    formatted_values = [str(item).ljust(value_spacing) for item in record]
    print(''.join(formatted_values))
"""

Enter_name = """
import csv

# Read the data from the CSV file
with open('C:/Users/SSS2022259/OneDrive/Desktop/File2py.csv', 'r', encoding='utf-8') as file:
    reader = csv.reader(file)
    data = list(reader)

# Extract the column headers
headers = data[0]

# Extract the column widths for formatting
header_width = 15
value_width = 15

# Format the column headers
formatted_headers = [header.strip().center(header_width) for header in headers]

# Output the column headers
# print(','.join(formatted_headers))


# Get the name input from the user
name = input("Enter a name: ")
print(''.join(formatted_headers))
print("____________________________________________________________________________")
# Search for the record with the entered name
found_record = None
for row in data[1:]:
    if row[0].strip().lower() == name.strip().lower():
        found_record = row
        continue


# Output the record if found
if found_record:
    formatted_record = [value.strip().center(value_width) for value in found_record]
    print(''.join(formatted_record))
else:
    print("Record not found.")

"""
# print("The Top 3 Minimum salary Holders details:")
# exec(min)
#
# print("The Top 3 maximum salary Holders details:")
# exec(max)
#
# print("The Full details of employees:")
# exec(full)
#
#
# print("First enter the employee name Next you see thier details:")
# exec(Enter_name)




# import testmodule as t
#
# print(t.show_file_contents)

try:
    exec(full)
    exec (max)
except:
    exec (min)
    exec(Enter_name)
#