$rg='group_for_assignment2'
$cnum= Read-Host -Prompt "Enter the number of storage clinets to create"
$snum= Read-Host -Prompt "Enter the number of servers to create"

for ($num = 1 ; $num -le $cnum ; $num++)
{
New-AzResourceGroupDeployment `
-ResourceGroupName $rg `
-TemplateFile 'C:\azure\01-storge_temp.json'`
}

for ($num = 1 ; $num -le $snum ; $num++)
{
New-AzResourceGroupDeployment `
-ResourceGroupName $rg `
-TemplateFile 'C:\azure\01-Windows_server_temp.json'`
}

