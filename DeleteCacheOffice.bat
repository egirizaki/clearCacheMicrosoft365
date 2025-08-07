@echo off
echo ============================================
echo     CLEANING MICROSOFT OFFICE 365 CACHE
echo ============================================
echo.

:: Jalankan PowerShell sebagai admin untuk menjalankan skrip internal
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Write-Host 'Mulai membersihkan cache dan registry...' -ForegroundColor Cyan; ^
Get-Process -Name WINWORD,EXCEL,OUTLOOK,POWERPNT -ErrorAction SilentlyContinue | Stop-Process -Force; ^
$paths = @( ^
    '$env:ProgramData\\Microsoft\\Office', ^
    '$env:ProgramData\\Microsoft\\OfficeSoftwareProtectionPlatform', ^
    '$env:LocalAppData\\Microsoft\\Office', ^
    '$env:LocalAppData\\Microsoft\\OneAuth', ^
    '$env:LocalAppData\\Microsoft\\IdentityCache', ^
    '$env:AppData\\Microsoft\\Office', ^
    '$env:AppData\\Microsoft\\Templates' ^
); ^
foreach ($p in $paths) { if (Test-Path $p) { Remove-Item -Path $p -Recurse -Force -ErrorAction SilentlyContinue; Write-Host 'Dihapus: ' $p } }; ^
try { ^
    $creds = cmdkey /list | Select-String -Pattern 'MicrosoftOffice|MicrosoftAccount|aad|SSO_POP_Device'; ^
    foreach ($line in $creds) { $target = $line.ToString().Split(':')[1].Trim(); cmdkey /delete:$target | Out-Null; Write-Host 'Credential dihapus: ' $target } ^
} catch { Write-Host 'Credential tidak ditemukan atau gagal dihapus' }; ^
$regPaths = @( ^
    'HKCU:\\Software\\Microsoft\\Office', ^
    'HKCU:\\Software\\Microsoft\\Office\\Common\\Identity', ^
    'HKLM:\\SOFTWARE\\Microsoft\\Office', ^
    'HKLM:\\SOFTWARE\\Microsoft\\OfficeSoftwareProtectionPlatform' ^
); ^
foreach ($reg in $regPaths) { if (Test-Path $reg) { Remove-Item -Path $reg -Recurse -Force -ErrorAction SilentlyContinue; Write-Host 'Registry dihapus: ' $reg } }; ^
Write-Host ''; Write-Host 'Pembersihan selesai. Silakan restart komputer Anda.' -ForegroundColor Green"

echo.
pause