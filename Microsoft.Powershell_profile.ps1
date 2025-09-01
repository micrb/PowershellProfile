
    $worktreeBase = "$HOME\Documents\git\branch"
    $worktreePath = Join-Path $worktreeBase $BranchName

    Write-Host "📂 Creating worktree for branch '$BranchName' at '$worktreePath'" -ForegroundColor Cyan

    # Run git worktree add
    git worktree add -b $BranchName $worktreePath#

    Write-Host "✅ Worktree created." -ForegroundColor Green

    # Path to Visual Studio (adjust edition if needed: Community / Professional / Enterprise)
    $vsPath = "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe"

    # Find a .sln file in the new worktree
    $sln = Get-ChildItem -Path $worktreePath -Filter *.sln -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1

    if ($sln) {
        Write-Host "🚀 Opening solution '$($sln.Name)' in Visual Studio..." -ForegroundColor Yellow
        & $vsPath $sln.FullName
    }
    else {
        Write-Host "⚠️ No .sln file found in '$worktreePath'" -ForegroundColor Red
    }
}
