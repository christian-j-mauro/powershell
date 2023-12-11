# Load Windows Forms and Drawing libraries
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a new form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Call Transfer Assistant'
$form.Size = New-Object System.Drawing.Size(300,300)
$form.StartPosition = 'CenterScreen'

# Function to get greeting based on time
function Get-Greeting {
    $hour = (Get-Date).Hour
    if ($hour -lt 12) { "Good morning" }
    elseif ($hour -lt 16) { "Good afternoon" }
    else { "Good evening" }
}

# Technician name label and textbox
$labelTech = New-Object System.Windows.Forms.Label
$labelTech.Location = New-Object System.Drawing.Point(10,20)
$labelTech.Size = New-Object System.Drawing.Size(280,20)
$labelTech.Text = 'Technician''s name:'
$form.Controls.Add($labelTech)

$textBoxTech = New-Object System.Windows.Forms.TextBox
$textBoxTech.Location = New-Object System.Drawing.Point(10,40)
$textBoxTech.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBoxTech)

# Client name label and textbox
$labelClient = New-Object System.Windows.Forms.Label
$labelClient.Location = New-Object System.Drawing.Point(10,70)
$labelClient.Size = New-Object System.Drawing.Size(280,20)
$labelClient.Text = 'Client''s name:'
$form.Controls.Add($labelClient)

$textBoxClient = New-Object System.Windows.Forms.TextBox
$textBoxClient.Location = New-Object System.Drawing.Point(10,90)
$textBoxClient.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBoxClient)

# Ticket number label and textbox
$labelTicket = New-Object System.Windows.Forms.Label
$labelTicket.Location = New-Object System.Drawing.Point(10,120)
$labelTicket.Size = New-Object System.Drawing.Size(280,20)
$labelTicket.Text = 'Ticket number:'
$form.Controls.Add($labelTicket)

$textBoxTicket = New-Object System.Windows.Forms.TextBox
$textBoxTicket.Location = New-Object System.Drawing.Point(10,140)
$textBoxTicket.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBoxTicket)

# Submit button
$submitButton = New-Object System.Windows.Forms.Button
$submitButton.Location = New-Object System.Drawing.Point(10,170)
$submitButton.Size = New-Object System.Drawing.Size(75,23)
$submitButton.Text = 'Submit'
$submitButton.Add_Click({
    $greeting = Get-Greeting
    $message = "$greeting $($textBoxTech.Text)! I have $($textBoxClient.Text) on the phone responding about # $($textBoxTicket.Text).`nWould you be able to take the call?"
    [System.Windows.Forms.MessageBox]::Show($message)
})
$form.Controls.Add($submitButton)

# Show the form
$form.ShowDialog()
