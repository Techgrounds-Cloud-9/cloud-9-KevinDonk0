//_______________LOGIN__________________
@description('Username for the Virtual Machine.')
param adminUsername string 

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string 


//_________________LOCATION__________________
@description('Location for all resources.')
param location string = resourceGroup().location


//_________________BOTH VM SIZE_________________
@description('Size of the virtual machine.')
param vmSize string = 'Standard_B2ms'

param keyvaulturl string = 'https://${keyvault}.vault.azure.net/'


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
param winVM string = 'WinVM'

param windnslabelprefix string = toLower('${winVM}-${uniqueString(resourceGroup().id)}')

param winpublicIPAddressName string = 'winpublicip'


//________________LINUX PARAM___________________
@description('The name of you Virtual Machine.')
param linvmname string = 'LinVM'


@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType string = 'password'


@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param lindnsLabelPrefix string = toLower('${linvmname}-${uniqueString(resourceGroup().id)}')

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  '12.04.5-LTS'
  '14.04.5-LTS'
  '16.04.0-LTS' 
  '18.04-LTS'
])
param ubuntuOSVersion string = '18.04-LTS'

@description('Name of the VNET')
param linVirtualNetworkName string = 'linvnetname'

@description('Name of the subnet in the virtual network')
param linsubnetName string = 'linSubnet'

@description('Name of the Network Security Group')
param linnetworkSecurityGroupName string = 'linNSG'



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


//__________________________Backup Policy______________________
@description('Name of the Recovery Services Vault')
param vaultName string ='recoveryservicesvault'

@description('Name of the Backup Policy')
param policyName string = 'backup_Policy'

@description('Times in day when backup should be triggered. e.g. 01:00 or 13:00. Must be an array, however for IaaS VMs only one value is valid. This will be used in LTR too for daily, weekly, monthly and yearly backup.')
param scheduleRunTimes array = [
  '18:00'
]

@description('Any Valid timezone, for example:UTC, Pacific Standard Time. Refer: https://msdn.microsoft.com/en-us/library/gg154758.aspx')
param timeZone string = 'W. Europe Standard Time'

@description('Number of days Instant Recovery Point should be retained')
@allowed([
  1
  2
  3
  4
  5
  6
  7
])
param instantRpRetentionRangeInDays int = 1

@description('Number of days you want to retain the backup')
param dailyRetentionDurationCount int = 7


//_____________________________Protected item PARAM________________________
@description('Array of Azure virtual machines. e.g. ["vm1","vm2","vm3"]')
param existingVirtualMachines array = ['WS_VM']

@description('Resource group where the virtual machines are located. This can be different than resource group of the vault. ')
param existingVirtualMachinesResourceGroup string = resourceGroup().name //changed


//_______________WINDOWS VAR___________________
var winnicname = 'winVMNic'
var winaddressPrefix = '10.20.20.0/24'
var winsubnetName = 'Mgmt-Subnet'
var winsubnetPrefix = '10.20.20.0/25'
var winvirtualNetworkName = 'Mgmt-Vnet'
var winnetworkSecurityGroupName = 'Mgmt-NSG'


//___________________LINUX VAR______________________
var linpublicIPAddressName = '${linvmname}-PublicIP'
var linnicname = '${linvmname}-NicName'
var linosDiskType = 'Standard_LRS'
var linsubnetAddressPrefix = '10.10.10.0/25'
var linaddressPrefix = '10.10.10.0/24'
var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPassword
      }
    ]
  }
}

//_____________________________Protected item VAR________________________
var backupFabric = 'Azure'
var v2VmContainer = 'iaasvmcontainer;iaasvmcontainerv2;'
var v2Vm = 'vm;iaasvmcontainerv2;'


//_____________________WINDOWS VM RESOURCES________________
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
          sourceAddressPrefix: '*'//winsubnetPrefix
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
      vmSize: vmSize
    }
    osProfile: {
      computerName: winVM
      adminUsername: adminUsername
      adminPassword: adminPassword
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
    keyVault
    Storage // ???
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
      KeyVaultResourceId: keyVault.id
      VolumeType:'All'
    }
  }
  dependsOn:[
    Storage
    Deployment_Script
  ]
}


//_______________________LINUX RESOURCES___________________
resource WS_Nic 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: linnicname
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'linipconfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', WS_Vnet.name, linsubnetName)
          }
          
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: WS_PublicIP.id
          }
        }
      }
    ]
  }
}


resource WS_NSG 'Microsoft.Network/networkSecurityGroups@2022-07-01' = {
  name: linnetworkSecurityGroupName
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
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
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
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
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


resource WS_Vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: linVirtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        linaddressPrefix
      ]
    }
    subnets:[
      {
        name: linsubnetName
        properties: {
          addressPrefix: linsubnetAddressPrefix
          networkSecurityGroup:{
            id:WS_NSG.id
          }
        }
      }
    ]
  }
}


resource WS_PublicIP 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: linpublicIPAddressName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: lindnsLabelPrefix
    }
    idleTimeoutInMinutes: 4
  }
}


resource WS_VM 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: linvmname
  location: location
  zones:[
    '2'
  ]
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: linosDiskType
        }
      }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: ubuntuOSVersion
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: WS_Nic.id
        }
      ]
    }
    osProfile: {
      computerName: linvmname
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: ((authenticationType == 'password') ? null : linuxConfiguration)
    }
  }
  dependsOn:[
    keyVault
  ]
}


resource WS_Disk_Encryption 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  parent:WS_VM
  name: 'WS_Disk_Encryption'
  location:location
  properties:{
    publisher: 'Microsoft.Azure.Security'
    type:'AzureDiskEncryptionForLinux'
    typeHandlerVersion: '1.1'
    autoUpgradeMinorVersion:true
    settings:{
      EncryptionOperation:'EnableEncryption'
      KeyEncryptionAlgorithm:'RSA-OAEP'
      KeyVaultURL: keyvaulturl
      KeyVaultResourceId:keyVault.id
      VolumeType:'OS'
    }
  }
  dependsOn:[
    WS_Install_Apache
  ]
}


resource WS_Install_Apache 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  parent:WS_VM
  name: 'install_apache'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Extensions'
    type: 'CustomScript'
    typeHandlerVersion: '2.1'
    autoUpgradeMinorVersion: true
    settings: {
      skipDos2Unix: false
      fileUris: [
        'https://kevintechgrounds.blob.core.windows.net/data/installapache.sh' //'https://gist.githubusercontent.com/daveRendon/72986871085786d04d0cdc2b1065355b/raw/34b2a4b5e05dc32f695c8236c89a2c62ce6213ca/install_apache.sh'
      ]
    }
    protectedSettings: {
      storageAccountName : storageAccountName
      storageAccountKey : listKeys(resourceId('Microsoft.Storage/storageAccounts', storageAccountName), '2022-05-01').keys[0].value
      commandToExecute: 'sh installapache.sh' //'sh installapache.sh'
    }
  }
  dependsOn:[
    Storage
    Deployment_Script
  ]
}


//___________________PEERING VMS___________________
resource Peering_1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  parent: Mgmt_Vnet
  name: '${linVirtualNetworkName}-${winvirtualNetworkName}'
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

resource Peering_2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  parent: WS_Vnet
  name: '${linVirtualNetworkName}-${winvirtualNetworkName}'
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


//_____________________Keyvault__________________
resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
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


//______________________Recovery service vault_________________
resource Recovery_Services_Vault 'Microsoft.RecoveryServices/vaults@2022-10-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess:'Enabled'
  }
  dependsOn:[
    keyVault
    Storage
  ]
}


//__________________________Backup Policy______________________
resource backup_Policy 'Microsoft.RecoveryServices/vaults/backupPolicies@2022-04-01' = {
  parent: Recovery_Services_Vault
  name: policyName
  location: location
  properties: {
    backupManagementType: 'AzureIaasVM'
    instantRpRetentionRangeInDays: instantRpRetentionRangeInDays
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      scheduleRunTimes: scheduleRunTimes
      schedulePolicyType: 'SimpleSchedulePolicy'
    }
    retentionPolicy: {
      dailySchedule: {
        retentionTimes: scheduleRunTimes
        retentionDuration: {
          count: dailyRetentionDurationCount
          durationType: 'Days'
        }
      }
      retentionPolicyType: 'LongTermRetentionPolicy'
    }
    timeZone: timeZone
  }
}


//____________________PROTECTED ITEMS______________________
resource Protected_Items 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/ProtectedItems@2022-04-01' = [for item in existingVirtualMachines: {
  name: '${vaultName}/${backupFabric}/${v2VmContainer}${existingVirtualMachinesResourceGroup};${item}/${v2Vm}${existingVirtualMachinesResourceGroup};${item}'
  location: location
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: backup_Policy.id
    sourceResourceId: resourceId(subscription().subscriptionId, existingVirtualMachinesResourceGroup, 'Microsoft.Compute/virtualMachines', '${item}')
  }
  dependsOn: [
    Recovery_Services_Vault
  ]
}]


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
resource Deployment_Script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
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

