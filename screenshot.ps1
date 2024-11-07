Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms
# Define the output file path in the user's temp directory
$outputPath = Join-Path -Path $env:TEMP -ChildPath "screenshot.png"

# Load the .NET class for drawing (if needed)
Add-Type -AssemblyName System.Drawing

# Define the screen dimensions
$screenWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
$screenHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height

# Create a new bitmap with screen dimensions
$bitmap = New-Object System.Drawing.Bitmap $screenWidth, $screenHeight

# Create graphics from bitmap
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)

# Capture the screen
$graphics.CopyFromScreen(0, 0, 0, 0, $bitmap.Size)

# Save the bitmap to file in the temp directory
$bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

# Clean up
$graphics.Dispose()
$bitmap.Dispose()

Write-Output "Screenshot saved to $outputPath"
