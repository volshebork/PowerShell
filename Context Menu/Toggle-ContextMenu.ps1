<# This script will toggle between the Windows 11 context menu and the Classic context menu. #>

$regPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}"

# Check if classic menu is currently enabled
if (Test-Path $regPath) {
    # Classic menu is enabled, switch to Windows 11 menu
    Write-Host "Switching to Windows 11 context menu..." -ForegroundColor Yellow
    reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
    Write-Host "Switched to Windows 11 context menu" -ForegroundColor Green
} else {
    # Windows 11 menu is active, switch to classic menu
    Write-Host "Switching to classic context menu..." -ForegroundColor Yellow
    reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
    Write-Host "Switched to classic context menu" -ForegroundColor Green
}

# Restart Explorer
Write-Host "Restarting Explorer..." -ForegroundColor Yellow
taskkill /f /im explorer.exe; start explorer.exe

Write-Host "Done!" -ForegroundColor Green
