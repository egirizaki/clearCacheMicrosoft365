# Jalankan sebagai Administrator
Write-Host "Mulai membersihkan cache dan sisa file Office 365..." -ForegroundColor Cyan

# Tutup aplikasi Office jika masih terbuka
Get-Process -Name WINWORD,EXCEL,OUTLOOK,POWERPNT -ErrorAction SilentlyContinue | Stop-Process -Force

# Hapus folder cache Office
$paths = @(
    "$env:ProgramData\Microsoft\Office",
    "$env:ProgramData\Microsoft\OfficeSoftwareProtectionPlatform",
    "$env:LocalAppData\Microsoft\Office",
    "$env:LocalAppData\Microsoft\OneAuth",
    "$env:LocalAppData\Microsoft\IdentityCache",
    "$env:AppData\Microsoft\Office",
    "$env:AppData\Microsoft\Templates"
)

foreach ($path in $paths) {
    if (Test-Path $path) {
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Dihapus: $path"
    }
}

# Hapus credential dari Windows Credential Manager
try {
    $creds = cmdkey /list | Select-String -Pattern "MicrosoftOffice|MicrosoftAccount|aad|SSO_POP_Device"
    foreach ($line in $creds) {
        $target = $line.ToString().Split(':')[1].Trim()
        cmdkey /delete:$target | Out-Null
        Write-Host "Credential dihapus: $target"
    }
} catch {
    Write-Host "Tidak dapat menghapus credential atau tidak ditemukan"
}

# Hapus Registry Key Office
$regPaths = @(
    "HKCU:\Software\Microsoft\Office",
    "HKCU:\Software\Microsoft\Office\Common\Identity",
    "HKLM:\SOFTWARE\Microsoft\Office",
    "HKLM:\SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform"
)

foreach ($reg in $regPaths) {
    if (Test-Path $reg) {
        Remove-Item -Path $reg -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Registry dihapus: $reg"
    }
}

Write-Host "`n Pembersihan selesai. Silakan restart komputer Anda sebelum install ulang Office." -ForegroundColor Green
