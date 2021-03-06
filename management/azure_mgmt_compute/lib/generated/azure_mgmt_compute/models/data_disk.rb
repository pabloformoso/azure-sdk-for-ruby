# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Compute
  module Models
    #
    # Describes a data disk.
    #
    class DataDisk

      include MsRestAzure

      # @return [Integer] the logical unit number.
      attr_accessor :lun

      # @return [String] the disk name.
      attr_accessor :name

      # @return [VirtualHardDisk] the Virtual Hard Disk.
      attr_accessor :vhd

      # @return [VirtualHardDisk] the Source User Image VirtualHardDisk. This
      # VirtualHardDisk will be copied before using it to attach to the
      # Virtual Machine. If SourceImage is provided, the destination
      # VirtualHardDisk should not exist.
      attr_accessor :image

      # @return [CachingTypes] the caching type. Possible values include:
      # 'None', 'ReadOnly', 'ReadWrite'
      attr_accessor :caching

      # @return [DiskCreateOptionTypes] the create option. Possible values
      # include: 'fromImage', 'empty', 'attach'
      attr_accessor :create_option

      # @return [Integer] the initial disk size in GB for blank data disks,
      # and the new desired size for existing OS and Data disks.
      attr_accessor :disk_size_gb


      #
      # Mapper for DataDisk class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'DataDisk',
          type: {
            name: 'Composite',
            class_name: 'DataDisk',
            model_properties: {
              lun: {
                required: true,
                serialized_name: 'lun',
                type: {
                  name: 'Number'
                }
              },
              name: {
                required: true,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              vhd: {
                required: true,
                serialized_name: 'vhd',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualHardDisk'
                }
              },
              image: {
                required: false,
                serialized_name: 'image',
                type: {
                  name: 'Composite',
                  class_name: 'VirtualHardDisk'
                }
              },
              caching: {
                required: false,
                serialized_name: 'caching',
                type: {
                  name: 'Enum',
                  module: 'CachingTypes'
                }
              },
              create_option: {
                required: true,
                serialized_name: 'createOption',
                type: {
                  name: 'Enum',
                  module: 'DiskCreateOptionTypes'
                }
              },
              disk_size_gb: {
                required: false,
                serialized_name: 'diskSizeGB',
                type: {
                  name: 'Number'
                }
              }
            }
          }
        }
      end
    end
  end
end
