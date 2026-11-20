# Creates the platform folders (android, ios, web, windows, ...) with `flutter create`
# and sets the launcher name on Android/iOS to "Orange ส้ม".
# Usage:  powershell -ExecutionPolicy Bypass -File .\setup_project.ps1
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

flutter create . --project-name flutter_workshop_ui_project --org com.example
if ($LASTEXITCODE -ne 0) { throw 'flutter create failed' }
flutter pub get
if ($LASTEXITCODE -ne 0) { throw 'flutter pub get failed' }

# "Orange ส้ม" built from code points so this script works in any file encoding.
$appName = 'Orange ' + [char]0x0E2A + [char]0x0E49 + [char]0x0E21
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$manifest = Join-Path $PSScriptRoot 'android\app\src\main\AndroidManifest.xml'
if (Test-Path $manifest) {
    $text = [IO.File]::ReadAllText($manifest)
    $text = [regex]::Replace($text, 'android:label="[^"]*"', "android:label=""$appName""")
    [IO.File]::WriteAllText($manifest, $text, $utf8NoBom)
    Write-Host "Android app name set to $appName"
}

$plist = Join-Path $PSScriptRoot 'ios\Runner\Info.plist'
if (Test-Path $plist) {
    $text = [IO.File]::ReadAllText($plist)
    $text = [regex]::Replace($text, '(<key>CFBundleDisplayName</key>\s*<string>)[^<]*(</string>)', "`${1}$appName`${2}")
    [IO.File]::WriteAllText($plist, $text, $utf8NoBom)
    Write-Host "iOS app name set to $appName"
}
