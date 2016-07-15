# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Batch
  module Models
    #
    # Response to an ApplicationOperations.AddApplicationPackage request.
    #
    class AddApplicationPackageResult

      include MsRestAzure

      # @return [String] The id of the application.
      attr_accessor :id

      # @return [String] The version of the application.
      attr_accessor :version

      # @return [String] The URL to which the application package binary file
      # should be uploaded.
      attr_accessor :storage_url

      # @return [DateTime] The UTC time at which the storage URL will expire.
      attr_accessor :storage_url_expiry


      #
      # Mapper for AddApplicationPackageResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'AddApplicationPackageResult',
          type: {
            name: 'Composite',
            class_name: 'AddApplicationPackageResult',
            model_properties: {
              id: {
                required: false,
                serialized_name: 'id',
                type: {
                  name: 'String'
                }
              },
              version: {
                required: false,
                serialized_name: 'version',
                type: {
                  name: 'String'
                }
              },
              storage_url: {
                required: false,
                serialized_name: 'storageUrl',
                type: {
                  name: 'String'
                }
              },
              storage_url_expiry: {
                required: false,
                serialized_name: 'storageUrlExpiry',
                type: {
                  name: 'DateTime'
                }
              }
            }
          }
        }
      end
    end
  end
end
