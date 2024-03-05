// pipeline task
// azure 리소스 최종 : vnet, nsg, vm(nic, vm, disk, pip(퍼블릭 ip)) web/was/db
// ci - azure repos에 있는 arm, bicep template spec으로 업로드 되는것(versioning)
// cd - 업로드된 template이 특정 resourcegroup으로 배포되는 것

// 제한 조건 : azure 의 self hosted agent로 구축하기(VM)// 이번주까지
// vnet 24비트 내로, subnet은 알아서... 가용성은 안해도 됨
// db는 public으로 뚫려있으면 안된다..
// nsg를 서브넷단으로 다르게 설정

// domain도 구매해서 ssl 인증서 넣기
// application gateway 설정해보기
// firewall 설정해보기(outbound 제어)
// policy 정책 built in 사용, custom policy 정책 사용하기




param location string = resourceGroup().location
param namePrefix string = 'stjoungwoo'

var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'
var storageAccountSku = 'Standard_RAGRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageAccountSku
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}

output storageAccountId string = storageAccount.id
