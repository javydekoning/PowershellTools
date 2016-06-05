function prompt {
   "[JavydeKoning.com] $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))"
}

ls $home\github\PowershellTools\ *.psm1 | % {import-module $_.fullname}