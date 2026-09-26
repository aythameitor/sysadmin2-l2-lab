param (
    [int]$DaysInactive = 90
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " [AUDITORIA AD] Analisis de Cuentas Inactivas (>$DaysInactive Dias) " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

$cutoffDate = (Get-Date).AddDays(-$DaysInactive)
Write-Host "[+] Fecha de corte para inactividad: $($cutoffDate.ToShortDateString())" -ForegroundColor Yellow

$mockUsers = @(
    [PSCustomObject]@{ Username = "dfernandez"; LastLogon = (Get-Date).AddDays(-120); Status = "Inactivo" },
    [PSCustomObject]@{ Username = "sromero";    LastLogon = (Get-Date).AddDays(-95);  Status = "Inactivo" },
    [PSCustomObject]@{ Username = "jgarcia";    LastLogon = (Get-Date).AddDays(-5);   Status = "Activo" }
)

$inactiveAccounts = $mockUsers | Where-Object { $_.LastLogon -lt $cutoffDate }

Write-Host "`n[+] Cuentas inactivas detectadas:" -ForegroundColor Red
$inactiveAccounts | Format-Table -AutoSize

Write-Host "[RECOMENDACION] Deshabilitar o mover a la OU 'Disabled_Users' segun politica de seguridad." -ForegroundColor Yellow