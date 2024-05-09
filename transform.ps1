param (
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Read the contents of the source text file
$text = Get-Content $FilePath

# Find the index of the first occurrence of "A."
$index = $text.IndexOf("A.")

# Get the first line of the text
$firstLine = $text[0]

# Join the lines from the second line to the index into a single line
$transformedText = $firstLine + "`r`n" + ($text[1..($index-1)] -join " ")

# Append the lines after the index to the transformed text
$transformedText += "`r`n" + $text[$index..($text.Length-1)] -join "`r`n"

# Replace occurrences of "A.", "B.", "C.", or "D." with a newline
$transformedText = $transformedText -replace "A\.", "`r`n" -replace "B\.", "`r`n" -replace "C\.", "`r`n" -replace "D\.", "`r`n"

# Create the new file name with "-transformed" added at the end
$newFilePath = $FilePath -replace "\.txt$", "-transformed.txt"

# Write the transformed text to the new file
$transformedText | Out-File -FilePath $newFilePath

Write-Host "Transformation completed. Transformed text saved to $newFilePath."