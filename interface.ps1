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
