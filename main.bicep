param vnet_location string = resourceGroup().location
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: 'vnet-test'
  location: vnet_location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '100.0.0.0/24'
      ]
    }
    subnets: [
      {
        name: 'MySubnet1'
        properties: {
          addressPrefix: '100.0.0.0/25'
        }
      }
      {
        name: 'MySubnet2'
        properties: {
          addressPrefix: '100.0.0.128/25'
        }
      }
    ]
  }
}
