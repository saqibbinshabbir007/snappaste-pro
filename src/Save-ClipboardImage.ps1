<#
.SYNOPSIS
    SnapPaste Pro -- Clipboard ki image (screenshot) ko PNG file mein save karke
    us file ka path clipboard pe (text ki tarah) daal deta hai.

.DESCRIPTION
    Windows terminal (CMD/PowerShell/Claude Code) sirf TEXT paste karta hai, image nahi.
    Ye script clipboard ki image ko Pictures\SnapPaste Pro mein PNG bana deta hai aur
    uska full path clipboard pe rakh deta hai -- phir Ctrl+V se path paste ho jata hai
    (bilkul Mac jaisa workflow).

    Agar clipboard mein image NAHI hai to script kuch nahi karta (clipboard ko chhedta
    bhi nahi) -- taake normal text paste pe koi asar na pare.

    --------------------------------------------------------------------
    SnapPaste Pro  |  by Saqib Bin Shabbir
    Full Stack Developer & Agentic AI Specialist
    --------------------------------------------------------------------

.PARAMETER Quiet
    Output path print mat karo (sirf clipboard pe set karo). AHK/automation ke liye useful.

.PARAMETER NoClipboard
    Clipboard ko mat badlo, sirf file save karke path return karo.

.OUTPUTS
    Saved PNG file ka full path (string), agar image mili. Warna kuch nahi.

.NOTES
    Exit code 0 = image mili aur save ho gayi. Exit code 1 = clipboard mein image nahi thi.
#>
[CmdletBinding()]
param(
    [switch]$Quiet,
    [switch]$NoClipboard
)

Add-Type -AssemblyName System.Windows.Forms -ErrorAction Stop
Add-Type -AssemblyName System.Drawing -ErrorAction Stop

# --- Clipboard se image lo (do tareeqe, jo chal jaye) ---
$img = $null
try {
    if ([System.Windows.Forms.Clipboard]::ContainsImage()) {
        $img = [System.Windows.Forms.Clipboard]::GetImage()
    }
} catch {
    # STA na ho to yahan exception aa sakta hai; neeche fallback try hoga
}

if ($null -eq $img) {
    try {
        $img = Get-Clipboard -Format Image -ErrorAction SilentlyContinue
    } catch { }
}

if ($null -eq $img) {
    if (-not $Quiet) {
        Write-Host "Clipboard mein koi image nahi hai. Pehle screenshot lo (Win+Shift+S), phir dobara chalao." -ForegroundColor Yellow
    }
    exit 1
}

# --- Save folder: <UserProfile>\Pictures\SnapPaste Pro (har client ke apne profile mein) ---
$picturesDir = Join-Path $env:USERPROFILE 'Pictures'
$saveDir = Join-Path $picturesDir 'SnapPaste Pro'
if (-not (Test-Path -LiteralPath $saveDir)) {
    New-Item -ItemType Directory -Path $saveDir -Force | Out-Null
}

# --- Filename: timestamp + milliseconds (clash na ho), no spaces ---
$stamp    = Get-Date -Format 'yyyyMMdd_HHmmss_fff'
$fileName = "screenshot_$stamp.png"
$fullPath = Join-Path $saveDir $fileName

# --- PNG save karo ---
try {
    $img.Save($fullPath, [System.Drawing.Imaging.ImageFormat]::Png)
} finally {
    $img.Dispose()
}

# --- Path ko clipboard pe text ki tarah daalo ---
if (-not $NoClipboard) {
    try {
        Set-Clipboard -Value $fullPath
    } catch {
        if (-not $Quiet) {
            Write-Host "Clipboard pe path set nahi ho saka: $_" -ForegroundColor Yellow
        }
    }
}

# --- Path output karo (taake terminal mein dikhe) ---
if (-not $Quiet) {
    Write-Host "Saved: " -ForegroundColor Green -NoNewline
    Write-Host $fullPath
    if (-not $NoClipboard) {
        Write-Host "Path clipboard pe copy ho gaya -- ab Ctrl+V se paste karo." -ForegroundColor Cyan
    }
}

# Pipeline ke liye bhi return karo
$fullPath
exit 0
