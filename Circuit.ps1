﻿# Charger l'assemblée Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Définir une classe personnalisée pour le label
class LabelClass : System.Windows.Forms.Label {
    LabelClass([string]$text, [int]$x, [int]$y, [int]$width, [int]$height) {
        $this.Text = $text
        $this.Location = [System.Drawing.Point]::new($x, $y)
        $this.Size = [System.Drawing.Size]::new($width, $height)
    }
}

# Définir une classe personnalisée pour le TextBox
class TextBoxClass : System.Windows.Forms.TextBox {
    TextBoxClass([int]$x, [int]$y, [int]$width, [int]$height) {
        $this.Location = [System.Drawing.Point]::new($x, $y)
        $this.Size = [System.Drawing.Size]::new($width, $height)
    }
}

class ButtonClass : System.Windows.Forms.Button {
    ButtonClass([string]$text, [int]$x, [int]$y, [int]$width, [int]$height) {
        $this.Text = $text
        $this.Location = [System.Drawing.Point]::new($x, $y)
        $this.Size = [System.Drawing.Size]::new($width, $height)
    }
}

# Créer une fenêtre
$form = New-Object Windows.Forms.Form
$form.Text = "Ma fenêtre"
$form.Size = [System.Drawing.Size]::new(800, 800)


# Créer instances 
$LA_Nom = New-Object LabelClass -ArgumentList "Nom", 50, 30, 200, 30
$TB_Nom = New-Object TextBoxClass -ArgumentList 50, 50, 200, 30
$LA_Age = New-Object LabelClass -ArgumentList "Age", 50, 80, 200, 30
$TB_Age = New-Object TextBoxClass -ArgumentList 50, 100, 200, 30

$customButton1 = New-Object ButtonClass -ArgumentList "Envoyer", 50, 150, 100, 30

# Ajouter les TextBox personnalisés à la fenêtre


$form.Controls.Add($TB_Nom)
$form.Controls.Add($TB_Age)
$form.Controls.Add($customButton1)
$form.Controls.Add($LA_Nom)
$form.Controls.Add($LA_Age)


# Créer deux instances de la classe personnalisée

# Ajouter les labels personnalisés à la fenêtre
$count = 1
$start = 30
Function placement ($labelText, $textBoxText) {
    
    # = 30
    $placement1 = $start
    # = 50                    
    $placement2 = $start + 20
    # = 80                   
    $placementProchain = $placement2 + 30

    $placementProchain = $start

}


Function ajouterCSV{
    $newCollection.Clear()
    $nombreAleatoire = Get-Random -Minimum 0 -Maximum 1000
    $rdm = "{0:D3}" -f $nombreAleatoire
     
    $csvPath = "FILE\FILE\FILE\"
    $csvData = Import-Csv -Path $csvPath

    $newRow = [PSCustomObject]@{
    Id = $rdm
    Nom = $TB_Nom.Text
    Age = $TB_Age.Text
}

    $newCollection = @($csvData, $newRow)

    $newCollection | Export-Csv -Path $csvPath -NoTypeInformation

    $csvData

}





$customButton1.Add_Click({
     
    ajouterCSV
    
    $csvData = Import-Csv -Path "FILE\FILE\FILE\"
    $csvData
})



<#




$newRow = [PSCustomObject]@{
    Id = "000001"
    Nom = "toto"
    Âge = 35
}
$csvData = $newRow + $csvData
$csvData | Export-Csv -Path "FILE\FILE\FILE\" -NoTypeInformation



$csvData = Import-Csv -Path "FILE\FILE\FILE\"
foreach ($row in $csvData) {
    Write-Host "Nom : $($row.Nom), Âge : $($row.Age)"
}






# Charger le fichier CSV dans une variable
$csvData = Import-Csv -Path "FILE\FILE\FILE\"

# Créer un nouvel objet PSObject pour la nouvelle ligne
$newRow = [PSCustomObject]@{
    Id = "000001"
    Nom = "toto"
    Age = "35"
}

# Ajouter la nouvelle ligne au tableau de données CSV
$csvDataList = [System.Collections.ArrayList]@($csvData)
$csvDataList.Add($newRow) | Out-Null

# Exporter le tableau mis à jour vers le fichier CSV
$csvDataList | Export-Csv -Path "FILE\FILE\FILE\" -NoTypeInformation


$newRow = [PSCustomObject]@{
    Id = "000002"
    Nom = "ATATA"
    Age = "42"
}
#>





















# Afficher la fenêtre
$form.ShowDialog()
$form.Close()
