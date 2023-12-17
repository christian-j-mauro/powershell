Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
 
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Call Transfer'
$form.Size = New-Object System.Drawing.Size(320,300)
$form.StartPosition = 'CenterScreen'

function Get-Greeting {
    $hour = (Get-Date).Hour
    if ($hour -lt 12) { "Good morning" }
    elseif ($hour -lt 17) { "Good afternoon" }
    else { "Good evening" }
}

# Custom Greeting
$labelCustomGreeting = New-Object System.Windows.Forms.Label
$labelCustomGreeting.Location = New-Object System.Drawing.Point(10,10)
$labelCustomGreeting.Size = New-Object System.Drawing.Size(280,20)
$labelCustomGreeting.Text = 'Custom greeting:'
$form.Controls.Add($labelCustomGreeting)

$textBoxCustomGreeting = New-Object System.Windows.Forms.TextBox
$textBoxCustomGreeting.Location = New-Object System.Drawing.Point(10,30)
$textBoxCustomGreeting.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($textBoxCustomGreeting)

# Technician
$labelTech = New-Object System.Windows.Forms.Label
$labelTech.Location = New-Object System.Drawing.Point(10,60)
$labelTech.Size = New-Object System.Drawing.Size(280,20)
$labelTech.Text = 'Technician''s name:'
$form.Controls.Add($labelTech)

$textBoxTech = New-Object System.Windows.Forms.TextBox
$textBoxTech.Location = New-Object System.Drawing.Point(10,80)
$textBoxTech.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($textBoxTech)
 
# Client
$labelClient = New-Object System.Windows.Forms.Label
$labelClient.Location = New-Object System.Drawing.Point(10,110)
$labelClient.Size = New-Object System.Drawing.Size(280,20)
$labelClient.Text = 'Client''s name:'
$form.Controls.Add($labelClient)

$textBoxClient = New-Object System.Windows.Forms.TextBox
$textBoxClient.Location = New-Object System.Drawing.Point(10,130)
$textBoxClient.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($textBoxClient)
 
# Ticket
$labelTicket = New-Object System.Windows.Forms.Label
$labelTicket.Location = New-Object System.Drawing.Point(10,160)
$labelTicket.Size = New-Object System.Drawing.Size(280,20)
$labelTicket.Text = 'Ticket number or issue:'
$form.Controls.Add($labelTicket)

$textBoxTicket = New-Object System.Windows.Forms.TextBox
$textBoxTicket.Location = New-Object System.Drawing.Point(10,180)
$textBoxTicket.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($textBoxTicket)
 
# Copy Button
$copyButton = New-Object System.Windows.Forms.Button
$copyButton.Location = New-Object System.Drawing.Point(110, 210)
$copyButton.Size = New-Object System.Drawing.Size(75,25)
$copyButton.Text = 'Copy'

$copyButton.Add_Click({
    $greeting = if ($textBoxCustomGreeting.Text -ne "") { $textBoxCustomGreeting.Text } else { Get-Greeting }
    $message = "$greeting $($textBoxTech.Text)! I have $($textBoxClient.Text) on the phone responding about $($textBoxTicket.Text).`nWould you be able to take the call?"
    [System.Windows.Forms.Clipboard]::SetText($message)
})
 
$form.Controls.Add($copyButton)
 
# Show the form
$form.ShowDialog()