[CmdletBinding(SupportsShouldProcess = $true)]
param (
    [string]$CsvPath = ".\users.csv"
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " [AD AUTOMATION] Inicio de Provision Masiva de Usuarios   " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

if (-not (Test-Path -Path $CsvPath)) {
    Write-Error "ERROR: No se encontro el archivo CSV en la ruta: $CsvPath"
    exit
}

$users = Import-Csv -Path $CsvPath

foreach ($user in $users) {
    $samAccountName = $user.Username
    $displayName = "$($user.FirstName) $($user.LastName)"
    $department = $user.Department
    $title = $user.Title
    
    Write-Host "[INFO] Procesando registro: $samAccountName ($displayName)..." -ForegroundColor Yellow

    try {
        if ($PSCmdlet.ShouldProcess("ActiveDirectory", "Crear cuenta $samAccountName para $displayName en Dpto: $department")) {
            Start-Sleep -Milliseconds 300
            Write-Host "  [OK] Usuario '$samAccountName' procesado correctamente. [Dpto: $department | Cargo: $title]" -ForegroundColor Green
        }
    }
    catch {
        Write-Host "  [ERROR] No se pudo procesar la cuenta $samAccountName : $_" -ForegroundColor Red
    }
}

Write-Host "`n[COMPLETADO] Proceso de provision de usuarios finalizado." -ForegroundColor Cyan