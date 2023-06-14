$o = new-object -com shell.application
$o.Namespace("$env:USERPROFILE").Self.InvokeVerb("pintohome")
$o.Namespace("${HOME}\Code").Self.InvokeVerb("pintohome")
$o.Namespace("${HOME}\Tools").Self.InvokeVerb("pintohome")
$o.Namespace("${HOME}\Files").Self.InvokeVerb("pintohome")
Write-Output "Custom directories pinned to quick access."