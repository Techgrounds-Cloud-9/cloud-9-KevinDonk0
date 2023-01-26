@description('Virtual Network name')
param virtualNetworkName string = 'aG-Vnet'

@description('Virtual Network address range')
param vnetAddressPrefix string = '10.10.10.0/24'

@description('Name of the subnet')
param subnetName1 string = 'aG-Subnet'
param subnetName2 string = 'VMScaleSet-Subnet'

@description('Subnet address range')
param subnetPrefix1 string = '10.10.10.0/25'
param subnetPrefix2 string = '10.10.10.128/25'


@description('Application Gateway name')
param applicationGatewayName string = 'aG-V2'

@description('Minimum instance count for Application Gateway')
param minCapacity int = 1

@description('Maximum instance count for Application Gateway')
param maxCapacity int = 3

@description('Application Gateway Frontend port')
param frontendPort int = 80

@description('Application gateway Backend port')
param backendPort int = 80

@description('Back end pool ip addresses')
param backendIPAddresses array = [
  {
    IpAddress: '10.10.10.4'
  }
]

@description('Cookie based affinity')
@allowed([
  'Enabled'
  'Disabled'
])
param cookieBasedAffinity string = 'Disabled'

@description('Location for all resources.')
param location string = resourceGroup().location


@description('Size of VMs in the VM Scale Set.')
param vmSku string = 'Standard_B2ms'

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  '12.04.5-LTS'
  '14.04.5-LTS'
  '16.04.0-LTS'
  '18.04-LTS'
])
param ubuntuOSVersion string = '18.04-LTS'

@description('''String used as a base for naming resources. Must be 3-61 characters in length and globally unique across Azure. 
A hash is prepended to this string for some resources, and resource-specific information is appended.''')
@minLength(3)
@maxLength(61)
param vmssName string = 'WebServer'

@description('Number of VM instances (100 or less).')
@minValue(1)
@maxValue(3)
param instanceCount int = 1

@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsLabelPrefix string = toLower('kevin-techgrounds')

param keyvaulturl string = 'https://${keyvault}.vault.azure.net/'

//__________________________LOGIN______________________
@description('Provide a admin username. this is for all VMs.')
param adminUsername string 

@description('Provide a admin password. this is for all VMs.')
@secure()
param adminPasswordOrKey string 

@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType string = 'password'

//__________________WINDOWS PARAM______________________
@description('The Windows version for the VM. This will pick a fully patched image of this given Windows version.')
@allowed([
'2008-R2-SP1'
'2008-R2-SP1-smalldisk'
'2012-Datacenter'
'2012-datacenter-gensecond'
'2012-Datacenter-smalldisk'
'2012-datacenter-smalldisk-g2'
'2012-Datacenter-zhcn'
'2012-datacenter-zhcn-g2'
'2012-R2-Datacenter'
'2012-r2-datacenter-gensecond'
'2012-R2-Datacenter-smalldisk'
'2012-r2-datacenter-smalldisk-g2'
'2012-R2-Datacenter-zhcn'
'2012-r2-datacenter-zhcn-g2'
'2016-Datacenter'
'2016-datacenter-gensecond'
'2016-datacenter-gs'
'2016-Datacenter-Server-Core'
'2016-datacenter-server-core-g2'
'2016-Datacenter-Server-Core-smalldisk'
'2016-datacenter-server-core-smalldisk-g2'
'2016-Datacenter-smalldisk'
'2016-datacenter-smalldisk-g2'
'2016-Datacenter-with-Containers'
'2016-datacenter-with-containers-g2'
'2016-datacenter-with-containers-gs'
'2016-Datacenter-zhcn'
'2016-datacenter-zhcn-g2'
'2019-Datacenter'
'2019-Datacenter-Core'
'2019-datacenter-core-g2'
'2019-Datacenter-Core-smalldisk'
'2019-datacenter-core-smalldisk-g2'
'2019-Datacenter-Core-with-Containers'
'2019-datacenter-core-with-containers-g2'
'2019-Datacenter-Core-with-Containers-smalldisk'
'2019-datacenter-core-with-containers-smalldisk-g2'
'2019-datacenter-gensecond'
'2019-datacenter-gs'
'2019-Datacenter-smalldisk'
'2019-datacenter-smalldisk-g2'
'2019-Datacenter-with-Containers'
'2019-datacenter-with-containers-g2'
'2019-datacenter-with-containers-gs'
'2019-Datacenter-with-Containers-smalldisk'
'2019-datacenter-with-containers-smalldisk-g2'
'2019-Datacenter-zhcn'
'2019-datacenter-zhcn-g2'
'2022-datacenter'
'2022-datacenter-azure-edition'
'2022-datacenter-azure-edition-core'
'2022-datacenter-azure-edition-core-smalldisk'
'2022-datacenter-azure-edition-smalldisk'
'2022-datacenter-core'
'2022-datacenter-core-g2'
'2022-datacenter-core-smalldisk'
'2022-datacenter-core-smalldisk-g2'
'2022-datacenter-g2'
'2022-datacenter-smalldisk'
'2022-datacenter-smalldisk-g2'
])
param OSVersion string = '2019-Datacenter'

@description('Name of the virtual machine.')
param winVM string = 'MGMT-VM'

param windnslabelprefix string = toLower('${winVM}-${uniqueString(resourceGroup().id)}')

param winpublicIPAddressName string = 'MGMT-PublicIP'

//___________________STORAGE_____________________
@description('Name of the blob as it is stored in the blob container')
param filename string = 'installapache.sh'
@description('Name of the blob container')
param containerName string = 'data'
@description('Desired name of the Storage account')
param storageAccountName string = 'kevintechgrounds'

//__________________KEYVAULT PARAM_______________
@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. Get it by using Get-AzSubscription cmdlet.')
param tenantid string = subscription().tenantId //'de60b253-74bd-4365-b598-b9e55a2b208d'

@description('''Specifies the object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault.
The object ID must be unique for the list of access policies. Get it by using Get-AzADUser or Get-AzADServicePrincipal cmdlets.''')
param objectid string = '6471301c-0b20-4e8f-8900-e3d34eb9e10b'

param keyvault string = 'keyvault${uniqueString(resourceGroup().id)}'

//_____________________WEBSERVER____________________
var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey
      }
    ]
  }
}

var osType = {
  publisher: 'Canonical'
  offer: 'UbuntuServer'
  sku: ubuntuOSVersion
  version: 'latest'
}
var imageReference = osType
var namingInfix = toLower(substring('${vmssName}${uniqueString(resourceGroup().id)}', 0, 10))

var nicName = '${namingInfix}-nic'
var ipConfigName = '${namingInfix}-ipconfig'

var vmssaGPublicIpName = '${namingInfix}-pip'
var networkSecurityGroupName ='${namingInfix}-NSG'

var appGwSize = 'Standard_v2'

//_______________WINDOWS VAR___________________
var winnicname = 'MGMT-Nic'
var winaddressPrefix = '10.20.20.0/24'
var winsubnetName = 'MGMT-Subnet'
var winsubnetPrefix = '10.20.20.0/25'
var winvirtualNetworkName = 'MGMT-Vnet'
var winnetworkSecurityGroupName = 'MGMT-NSG'



//_____________________WEBSERVER_____________________
resource WS_NSG 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: [
      {
        id:'HTTP'
        name: 'nsgRuleAllowHTTP'
        properties: {
          description: 'AllowHTTP'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '80'
          destinationAddressPrefix: '10.10.10.0/24'
          access: 'Allow'
          priority: 600
          direction: 'Inbound'
        }
      }
      {
        id:'HTTPS'
        name: 'nsgRuleAllowHTTPS'
        properties: {
          description: 'AllowHTTPS'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationPortRange: '443'
          destinationAddressPrefix: '10.10.10.0/24'
          access: 'Allow'
          priority: 500
          direction: 'Inbound'
        }
      }
      {
        id:'SSH'
        name: 'nsgRuleAllowSSH'
        properties: {
          description: 'AllowSSH'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '10.20.20.0/24' 
          destinationAddressPrefix: '10.10.10.0/24'
          access: 'Allow'
          priority: 400
          direction: 'Inbound'
        }
      }
    ]
  }
}


resource WS_Vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName1
        properties: {
          addressPrefix: subnetPrefix1
        }
      }
      {
        name: subnetName2
        properties: {
          addressPrefix: subnetPrefix2
          networkSecurityGroup:{
            id:WS_NSG.id
          }
        }
      }
    ]
  }
}


resource AG_PublicIP 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: vmssaGPublicIpName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix
    }
  }
}


//__________________APPLICATION GATEWAYS____________________
resource AG 'Microsoft.Network/applicationGateways@2020-06-01' = {
  name: applicationGatewayName
  location: location
  properties: {
    sku: {
      name: appGwSize
      tier: 'Standard_v2'
    }
    autoscaleConfiguration: {
      minCapacity: minCapacity
      maxCapacity: maxCapacity 
    }
    sslPolicy:{
      cipherSuites:[
        'TLS_DHE_RSA_WITH_AES_128_GCM_SHA256'
      ]
      policyType:'Custom'
      minProtocolVersion:'TLSv1_2'
    }
    probes:[
      {
        name: 'HealthProbe'
        properties:{
          pickHostNameFromBackendHttpSettings:true
          interval: 60
          protocol:'http'
          port: 80
          path:'/health'
          timeout:15
        }
      }
    ]
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, subnetName1)
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: AG_PublicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGatewayFrontendPort'
        properties: {
          port: frontendPort
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'appGatewayBackendPool'
        properties: {
          backendAddresses: backendIPAddresses
        }
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'appGatewayBackendHttpSettings'
        properties: {
          port: backendPort
          protocol: 'Http'
          cookieBasedAffinity: cookieBasedAffinity
        }
      }
    ]
    httpListeners: [
      {
        name: 'appGatewayHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', applicationGatewayName, 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', applicationGatewayName, 'appGatewayFrontendPort')
          }
          protocol: 'Http'
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'rule1'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', applicationGatewayName, 'appGatewayHttpListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGatewayName, 'appGatewayBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', applicationGatewayName, 'appGatewayBackendHttpSettings')
          }
        }
      }
    ]
  }
  dependsOn:[
    WS_Vnet
    WS_NSG
  ]
}



//_____________________VIRTUAL MACHINE SCALE SET_____________________
resource VM_SS 'Microsoft.Compute/virtualMachineScaleSets@2021-03-01' = {
  name: vmssName
  location: location
  sku: {
    name: vmSku
    tier: 'Standard'
    capacity: instanceCount
  }
  zones:[
    '2'
  ]
  properties: {
    automaticRepairsPolicy:{
      enabled:true
      gracePeriod:'PT10M'
    }
    orchestrationMode:'Flexible'
    platformFaultDomainCount : 1 
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          createOption: 'FromImage'
          caching: 'ReadWrite'
        }
        imageReference: imageReference
      }
      osProfile: {
        computerNamePrefix: namingInfix
        adminUsername: adminUsername
        adminPassword: adminPasswordOrKey
        linuxConfiguration: ((authenticationType == 'password') ? json('null') : linuxConfiguration)
      }
      networkProfile: {
        networkApiVersion:'2020-11-01' 
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              enableIPForwarding:true
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    publicIPAddressConfiguration:{
                      name: vmssaGPublicIpName
                    }
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, subnetName2)
                    }
                    applicationGatewayBackendAddressPools:[
                      { 
                        id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGatewayName, 'appGatewayBackendPool')
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }      
      extensionProfile: {
        extensions: [
          {
            name: 'vmssExtension'
            properties: {
              publisher: 'Microsoft.Azure.Extensions'
              type: 'CustomScript'
              typeHandlerVersion: '2.1'
              autoUpgradeMinorVersion: true
              
              settings: {
                skipDos2Unix:false
                fileUris: [
                  'https://kevintechgrounds.blob.core.windows.net/data/installapache.sh'
                ]
              }
              protectedSettings: {
                storageAccountName : storageAccountName
                storageAccountKey : listKeys(resourceId('Microsoft.Storage/storageAccounts', storageAccountName), '2022-05-01').keys[0].value
                commandToExecute: 'sh installapache.sh' 
              }
            }
          }
          {
            name: 'healthChecker'
            properties:{
              publisher:'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              autoUpgradeMinorVersion:true
              typeHandlerVersion: '1.0'
              settings:{
                protocol: 'tcp'
                port: 80
              }
            }
          }
        ]
      }
    }
  }
  dependsOn: [
    Storage
    Keyvault
    AG
    Deplyment_Script
  ]
}


//_____________________AUTO SCALE SETTINGS_____________________
resource Auto_Scale_Settings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'cpuautoscale'
  location: location
  properties: {
    name: 'cpuautoscale'
    targetResourceUri: VM_SS.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: VM_SS.id
              timeGrain: 'PT1M'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 70
              statistic: 'Average'
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT3M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: VM_SS.id
              timeGrain: 'PT1M'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
              statistic: 'Average'
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT3M'
            }
          }
        ]
      }
    ]
  }
}


//_____________________Keyvault__________________
resource Keyvault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyvault
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
    tenantId: tenantid
    accessPolicies: [
      {
        tenantId: tenantid
        objectId: objectid
        permissions: {
          keys: [
            'get'

          ]
          secrets: [
            'list'
            'get'
            'set'
          ]
          certificates:[
            'all'
          ]
        }
      }
    ]
    sku: {
      name: 'standard'
      family: 'A'
    }
  }
  dependsOn:[
    Storage
  ]
}


//_______________________STORAGE_____________________
resource Storage 'Microsoft.Storage/storageAccounts@2022-05-01'= {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    allowCrossTenantReplication: false
    encryption: {
      keySource: 'Microsoft.Storage'
    }
  }
  resource blobService 'blobServices' = {
    name: 'default'
    resource container 'containers' = {
      name: containerName
    }
  }
}


//_____________________DEPLOYMENT SCRIPT_____________________
resource Deplyment_Script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'deployscript-upload-blob'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.26.1'
    timeout: 'PT1H'
    retentionInterval: 'PT1H'
    environmentVariables: [
      {
        name: 'AZURE_STORAGE_ACCOUNT'
        value: Storage.name
      }
      {
        name: 'AZURE_STORAGE_KEY'
        secureValue: Storage.listKeys().keys[0].value
      }
      {
        name: 'CONTENT'
        value: loadTextContent('./installapache.sh')
      }
    ]
    scriptContent: 'echo "$CONTENT" > ${filename} && az Storage blob upload -f ${filename} -c ${containerName} -n ${filename}'
  }
}


//_____________________MANAGEMENT SERVER________________
resource Mgmt_NSG 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: winnetworkSecurityGroupName
  location: location
  properties: {
    securityRules: [
      {
        id:'RDP'
        name: 'nsgRuleAllowRDP'
        properties: {
          description: 'AllowRDP'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '10.20.20.0/24'
          access: 'Allow'
          priority: 300
          direction: 'Inbound'
        }
      }
      {
        id:'SSH'
        name: 'nsgRuleAllowSSH'
        properties: {
          description: 'AllowSSH'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: winsubnetPrefix
          destinationAddressPrefix: '10.20.20.0/24'
          access: 'Allow'
          priority: 200
          direction: 'Inbound'
        }
      }
    ]
  }
}


resource Mgmt_Vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: winvirtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        winaddressPrefix
      ]
    }
    subnets: [
      {
        name: winsubnetName
        properties: {
          addressPrefix: winsubnetPrefix
          networkSecurityGroup: {
            id: Mgmt_NSG.id
          }
        }
      }
    ]
  }
}


resource Mgmt_Nic 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: winnicname
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'winipconfig'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', Mgmt_Vnet.name, winsubnetName)
          }
          publicIPAddress: {
            id: Mgmt_PublicIP.id
          }
        }
      }
    ]
  }
}


resource Mgmt_PublicIP 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: winpublicIPAddressName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: windnslabelprefix
    }
    idleTimeoutInMinutes: 4
  }
}


resource Mgmt_VM 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: winVM
  location: location
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize: vmSku
    }
    osProfile: {
      computerName: winVM
      adminUsername: adminUsername
      adminPassword: adminPasswordOrKey
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: OSVersion
        version: 'latest'
      }
      osDisk: {
        managedDisk:{
          storageAccountType:'Standard_LRS' 
        }
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: Mgmt_Nic.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: false
      }
    }
  }
  dependsOn:[
    Keyvault
  ]
}


resource Mgmt_Disk_Encryption 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  parent: Mgmt_VM
  name: 'Mgmt_Disk_Encryption'
  location:location
  properties:{
    publisher: 'Microsoft.Azure.Security'
    type:'AzureDiskEncryption'
    typeHandlerVersion: '2.2'
    autoUpgradeMinorVersion:true
    forceUpdateTag: '1.0'
    settings:{
      EncryptionOperation: 'EnableEncryption'
      KeyEncryptionAlgorithm: 'RSA-OAEP'
      KeyVaultURL: keyvaulturl
      KeyVaultResourceId: Keyvault.id
      VolumeType:'All'
    }
  }
  dependsOn:[
    Storage
    Deplyment_Script
  ]
}


//___________________PEERING VMS___________________
resource Peering1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  parent: Mgmt_Vnet
  name: '${winvirtualNetworkName}-${virtualNetworkName}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: WS_Vnet.id
    }
  }
}

resource Peering2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  parent: WS_Vnet
  name: '${virtualNetworkName}-${winvirtualNetworkName}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: Mgmt_Vnet.id
    }
  }
}




