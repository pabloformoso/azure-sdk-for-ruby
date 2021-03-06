# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::MediaServices
  module Models
    #
    # The response body for a RegenerateKey API.
    #
    class RegenerateKeyOutput

      include MsRestAzure

      # @return [String] The new value of either the primary or secondary key.
      attr_accessor :key


      #
      # Mapper for RegenerateKeyOutput class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'RegenerateKeyOutput',
          type: {
            name: 'Composite',
            class_name: 'RegenerateKeyOutput',
            model_properties: {
              key: {
                required: false,
                serialized_name: 'key',
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
