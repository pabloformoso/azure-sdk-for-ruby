# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::RecoveryServicesBackup
  module Models
    #
    # Filters to list backup items.
    #
    class ProtectedItemQueryObject

      include MsRestAzure

      # @return [BackupManagementType] Backup management type for the backed
      # up item. Possible values include: 'Invalid', 'AzureIaasVM', 'MAB',
      # 'DPM', 'AzureBackupServer', 'AzureSql'
      attr_accessor :backup_management_type

      # @return [DataSourceType] Type of workload this item represents.
      # Possible values include: 'Invalid', 'VM', 'FileFolder', 'AzureSqlDb',
      # 'SQLDB', 'Exchange', 'Sharepoint', 'DPMUnknown'
      attr_accessor :item_type

      # @return [String] Backup policy name associated with the backup item.
      attr_accessor :policy_name

      # @return [String] Name of the container.
      attr_accessor :container_name


      #
      # Mapper for ProtectedItemQueryObject class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'ProtectedItemQueryObject',
          type: {
            name: 'Composite',
            class_name: 'ProtectedItemQueryObject',
            model_properties: {
              backup_management_type: {
                required: false,
                serialized_name: 'backupManagementType',
                type: {
                  name: 'Enum',
                  module: 'BackupManagementType'
                }
              },
              item_type: {
                required: false,
                serialized_name: 'itemType',
                type: {
                  name: 'Enum',
                  module: 'DataSourceType'
                }
              },
              policy_name: {
                required: false,
                serialized_name: 'policyName',
                type: {
                  name: 'String'
                }
              },
              container_name: {
                required: false,
                serialized_name: 'containerName',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
