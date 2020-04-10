$spotifyStorage = "C:\Users\" + $env:USERNAME + "\AppData\Local\Spotify\Storage"
[Decimal]$maxSizeInMb = 1000.0

if (! (Test-Path $spotifyStorage) ) { Exit } 

[Decimal]$spotifyStorageSize = 
    ("{0:N2}" -f ((Get-ChildItem $spotifyStorage -Recurse | Measure-Object -Property length -Sum -ErrorAction Stop).Sum / 1Mb)).Replace(",", ".")

$spotifyStatus = New-Object -TypeName psobject
$spotifyStatus | Add-Member -MemberType NoteProperty -Name Path -Value $spotifyStorage
$spotifyStatus | Add-Member -MemberType NoteProperty -Name Size -Value $spotifyStorageSize
$spotifyStatus | Add-Member -MemberType NoteProperty -Name "Max Size" -Value $maxSizeInMb

$spotifyStatus

if ($spotifyStorageSize -gt $maxSizeInMb) {
    Remove-Item $spotifyStorage -Recurse
}