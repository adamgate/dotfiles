New-Item $HOME/.nvim -ItemType Directory -Force | Out-Null
Copy-Item -path ../../../cross-platform/vim/*.vim -Destination $HOME\.nvim | Out-Null
