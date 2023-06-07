
Connect-AzAccount -UseDeviceAuthenticatio
$ctx = New-AzStorageContext -StorageAccountName newstorageyarin1  -UseConnectedAccount
$ctx2 = New-AzStorageContext -StorageAccountName newstorageyarin2  -UseConnectedAccount
$ContainerName="test3"

  for ($num = 1 ; $num -le 100 ; $num++)
  {
    $Blob1HT = @{
        File             = 'C:\text\text.txt'
        Container        = $ContainerName
        Blob             = "$num.txt"
        Context          = $ctx
        StandardBlobTier = 'Hot'
      }

  Set-AzStorageBlobContent @Blob1HT
  }


  for ($num = 1 ; $num -le 100 ; $num++)
  {
   Start-AzStorageBlobCopy `
    -SrcBlob "$num.txt" `
    -SrcContainer "indcont" `
    -Context $ctx `
    -DestBlob "$num.txt" `
    -DestContainer $ContainerName `
    -DestContext $ctx2
  }