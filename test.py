# Define the path to your file
file_path = 'example.txt'

# Open the file in read mode ('r')
with open(file_path, 'r') as file:
    # Read the entire content of the file into a string
    content = file.read()

# Print the content of the file
print(content)