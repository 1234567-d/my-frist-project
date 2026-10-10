Set-Location -LiteralPath 'D:\网安学习笔记'
git add -A
$status = git status --porcelain
if (-not $status) { exit 0 }
git commit -m ("auto backup " + (Get-Date -Format 'yyyy-MM-dd HH:mm'))
git push origin main
