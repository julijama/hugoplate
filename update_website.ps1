[string]$CommitMessage = $args[0] 

if ([string]::IsNullOrEmpty($CommitMessage))
{
    Write-Host "You need to specify the changes to commit as an argument."
    Exit
}
  
git add -A
git commit -m "$CommitMessage"
git push -u origin main

npm run build

Set-Location .\public
git add -A
git commit -m "$CommitMessage"
git pull
git push -u origin main

Set-Location ..
git add .
git commit -m "Update submodule"
git push -u origin main
