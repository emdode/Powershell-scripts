#MaDr script

$Days = "-31"
$Res = New-object -com "UIResource.UIResourceMGR"

$cacheInfo = $Res.GetCacheInfo()
$cacheInfo.GetCacheElements() |
  Where-object { $_.LastReferenceTime -lt (get-date).AddDays($Days)} |
    foreach-object (cacheInfo.DeleteCacheElement($_.CacheElementID)}
