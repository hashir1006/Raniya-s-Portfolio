Add-Type -AssemblyName System.Drawing

$width = 900
$height = 1100

$bmp = [System.Drawing.Bitmap]::new($width, $height, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$gfx.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$gfx.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
$gfx.Clear([System.Drawing.Color]::Transparent)

# 1. Torso Silhouette (Shoulders and upper body)
$torsoPath = [System.Drawing.Drawing2D.GraphicsPath]::new()
$torsoPoints = [System.Drawing.Point[]]@(
    [System.Drawing.Point]::new(110, 1100),
    [System.Drawing.Point]::new(140, 840),
    [System.Drawing.Point]::new(200, 680),
    [System.Drawing.Point]::new(310, 540),
    [System.Drawing.Point]::new(370, 470),
    [System.Drawing.Point]::new(395, 380),
    # Neck & chin
    [System.Drawing.Point]::new(420, 390),
    [System.Drawing.Point]::new(450, 420),
    [System.Drawing.Point]::new(475, 470),
    [System.Drawing.Point]::new(530, 540),
    [System.Drawing.Point]::new(640, 680),
    [System.Drawing.Point]::new(700, 840),
    [System.Drawing.Point]::new(730, 1100)
)
$torsoPath.AddCurve($torsoPoints)
$torsoPath.CloseFigure()

$torsoGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
    [System.Drawing.Point]::new(0, 380),
    [System.Drawing.Point]::new(0, 1100),
    [System.Drawing.Color]::FromArgb(255, 32, 36, 46),
    [System.Drawing.Color]::FromArgb(255, 12, 14, 18)
)
$gfx.FillPath($torsoGrad, $torsoPath)

# 2. Torso subtle inner chest / collar highlight
$collarPath = [System.Drawing.Drawing2D.GraphicsPath]::new()
$collarPoints = [System.Drawing.Point[]]@(
    [System.Drawing.Point]::new(395, 480),
    [System.Drawing.Point]::new(420, 560),
    [System.Drawing.Point]::new(450, 480)
)
$collarPath.AddCurve($collarPoints)
$collarBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(40, 255, 255, 255))
$gfx.FillPath($collarBrush, $collarPath)

# 3. Head & Hair Contour (Modern elegant hairstyle)
$headPath = [System.Drawing.Drawing2D.GraphicsPath]::new()
$headPoints = [System.Drawing.Point[]]@(
    [System.Drawing.Point]::new(350, 340),
    [System.Drawing.Point]::new(325, 240),
    [System.Drawing.Point]::new(355, 130),
    [System.Drawing.Point]::new(425, 85),
    [System.Drawing.Point]::new(500, 110),
    [System.Drawing.Point]::new(535, 200),
    [System.Drawing.Point]::new(515, 340),
    [System.Drawing.Point]::new(465, 400),
    [System.Drawing.Point]::new(425, 415),
    [System.Drawing.Point]::new(385, 395)
)
$headPath.AddClosedCurve($headPoints)
$headGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
    [System.Drawing.Point]::new(0, 85),
    [System.Drawing.Point]::new(0, 415),
    [System.Drawing.Color]::FromArgb(255, 42, 47, 60),
    [System.Drawing.Color]::FromArgb(255, 18, 20, 26)
)
$gfx.FillPath($headGrad, $headPath)

# 4. Soft Rim Light on left contour
$rimPenLeft = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(220, 230, 240, 255), 4.5)
$leftPoints = [System.Drawing.Point[]]@(
    [System.Drawing.Point]::new(355, 130),
    [System.Drawing.Point]::new(325, 240),
    [System.Drawing.Point]::new(350, 340),
    [System.Drawing.Point]::new(370, 470),
    [System.Drawing.Point]::new(310, 540),
    [System.Drawing.Point]::new(200, 680),
    [System.Drawing.Point]::new(140, 840),
    [System.Drawing.Point]::new(110, 1100)
)
$gfx.DrawCurve($rimPenLeft, $leftPoints)

# 5. Soft Rim Light on right contour
$rimPenRight = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(160, 195, 215, 240), 3.5)
$rightPoints = [System.Drawing.Point[]]@(
    [System.Drawing.Point]::new(500, 110),
    [System.Drawing.Point]::new(535, 200),
    [System.Drawing.Point]::new(515, 340),
    [System.Drawing.Point]::new(475, 470),
    [System.Drawing.Point]::new(530, 540),
    [System.Drawing.Point]::new(640, 680),
    [System.Drawing.Point]::new(700, 840),
    [System.Drawing.Point]::new(730, 1100)
)
$gfx.DrawCurve($rimPenRight, $rightPoints)

# 6. Sleek Studio Badge
$badgeBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(235, 16, 20, 26))
$badgeBorder = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(100, 255, 255, 255), 1.5)
$badgeRect = [System.Drawing.Rectangle]::new(210, 660, 420, 120)
$gfx.FillRectangle($badgeBrush, $badgeRect)
$gfx.DrawRectangle($badgeBorder, $badgeRect)

# 7. Typography inside badge
$fontTitle = [System.Drawing.Font]::new("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$fontSub = [System.Drawing.Font]::new("Segoe UI", 11, [System.Drawing.FontStyle]::Regular)
$textBrushTitle = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(250, 255, 255, 255))
$textBrushSub = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(170, 185, 200))

$sf = [System.Drawing.StringFormat]::new()
$sf.Alignment = [System.Drawing.StringAlignment]::Center
$sf.LineAlignment = [System.Drawing.StringAlignment]::Center

$gfx.DrawString("RANIYA KAZI", $fontTitle, $textBrushTitle, [System.Drawing.RectangleF]::new(210, 675, 420, 30), $sf)
$gfx.DrawString("PORTRAIT PLACEHOLDER", $fontSub, $textBrushSub, [System.Drawing.RectangleF]::new(210, 710, 420, 25), $sf)
$gfx.DrawString("Place raniya-portrait.png in /public to customize", $fontSub, $textBrushSub, [System.Drawing.RectangleF]::new(210, 735, 420, 25), $sf)

# 8. Gradient blend to black at the bottom
$fadeRect = [System.Drawing.Rectangle]::new(0, 960, $width, 140)
$fadeGrad = [System.Drawing.Drawing2D.LinearGradientBrush]::new(
    [System.Drawing.Point]::new(0, 960),
    [System.Drawing.Point]::new(0, 1100),
    [System.Drawing.Color]::FromArgb(0, 0, 0, 0),
    [System.Drawing.Color]::FromArgb(255, 0, 0, 0)
)
$gfx.FillRectangle($fadeGrad, $fadeRect)

$outputPath = Join-Path $PSScriptRoot "..\public\raniya-portrait.png"
$bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)

$gfx.Dispose()
$bmp.Dispose()
Write-Output "Successfully updated portrait placeholder at $outputPath"
