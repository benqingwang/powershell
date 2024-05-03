"""
Step 1: Setup Your Python Script
First, you'll need a Python script that can take a file path as an argument, process the file, and then save the results to an HTML file on the desktop. Here's a simple Python script that reads a text file, counts the occurrences of each word, and outputs the results in HTML format.

Python Script (save as process_file.py):"""


import sys
from collections import Counter
import os

def process_file(file_path):
    # Read the file
    with open(file_path, 'r') as file:
        text = file.read()
    
    # Count words
    word_count = Counter(text.split())
    
    # Generate HTML content
    html_content = '<html><head><title>Word Count</title></head><body><h1>Word Count Results</h1><ul>'
    for word, count in word_count.items():
        html_content += f'<li>{word}: {count}</li>'
    html_content += '</ul></body></html>'
    
    # Save the HTML file on the desktop
    desktop_path = os.path.join(os.path.expanduser('~'), 'Desktop', 'word_count_results.html')
    with open(desktop_path, 'w') as html_file:
        html_file.write(html_content)

if __name__ == "__main__":
    process_file(sys.argv[1])

"""
Step 2: Create the PowerShell Script
Next, create a PowerShell script that launches a GUI for selecting a file, and then runs the Python script using the selected file as input.

PowerShell Script (save as launch_tool.ps1):
"""
    


Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create Open File Dialog
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.InitialDirectory = [System.Environment]::GetFolderPath('Desktop')
$openFileDialog.Filter = 'Text files (*.txt)|*.txt|All files (*.*)|*.*'
$openFileDialog.ShowDialog() | Out-Null

# Check if a file was selected
if ($openFileDialog.FileName) {
    # Construct the command to run the Python script
    $pythonPath = 'python'  # Update this if Python is not in PATH
    $filePath = $openFileDialog.FileName
    $cmd = "$pythonPath `"$filePath`""

    # Execute the Python script
    Invoke-Expression $cmd

    # Optionally, you can inform the user that processing is complete
    [System.Windows.Forms.MessageBox]::Show('File has been processed and results saved on Desktop.', 'Completed')
}

"""
How to Use These Scripts
Ensure Python and PowerShell are installed: Your system needs to have Python installed and accessible from the PATH, or you need to specify the full path to the Python executable in the PowerShell script.
Run the PowerShell script: Execute launch_tool.ps1 using PowerShell. This will open a file dialog asking you to upload a file. Once a file is selected, it will automatically be processed by the Python script, which saves the results as an HTML file on your desktop.
This setup allows you to harness the power of both PowerShell and Python in a simple, effective manner for processing files and outputting HTML results.
"""
