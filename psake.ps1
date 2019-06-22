# Set Properties Here

Properties {
    $lines = '----------------------------------------------------------------------'
    # Find the build folder based on build system
    $ProjectRoot = $ENV:BHProjectPath
    if (-not $ProjectRoot) {
        $ProjectRoot = $PSScriptRoot
    }
    $ProjectRoot = Convert-Path $ProjectRoot

    try {
        $script:IsWindows = (-not (Get-Variable -Name IsWindows -ErrorAction Ignore)) -or $IsWindows
        $script:IsLinux = (Get-Variable -Name IsLinux -ErrorAction Ignore) -and $IsLinux
        $script:IsMacOS = (Get-Variable -Name IsMacOS -ErrorAction Ignore) -and $IsMacOS
        $script:IsCoreCLR = $PSVersionTable.ContainsKey('PSEdition') -and $PSVersionTable.PSEdition -eq 'Core'
    } catch { }
}

Task Default -depends Deploy


Task Init {
    $lines
}

Task Test -depends Init,Pester {
    $lines

}
Task Pester {
    $Lines
    Invoke-Pester -tag project
}

Task Build -depends Test {
    $lines

}

Task Deploy -depends Build {
    $lines
}
