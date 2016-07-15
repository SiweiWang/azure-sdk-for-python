# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::MobileEngagement
  module Models
    #
    # Target devices based on a boolean tag value.
    #
    class BooleanTagCriterion < Criterion

      include MsRestAzure


      def initialize
        @type = "boolean-tag"
      end

      attr_accessor :type

      # @return [String] The name of the custom tag.
      attr_accessor :name

      # @return [Boolean] A custom boolean value to match.
      attr_accessor :value


      #
      # Mapper for BooleanTagCriterion class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'boolean-tag',
          type: {
            name: 'Composite',
            class_name: 'BooleanTagCriterion',
            model_properties: {
              type: {
                required: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              name: {
                required: false,
                serialized_name: 'name',
                type: {
                  name: 'String'
                }
              },
              value: {
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Boolean'
                }
              }
            }
          }
        }
      end
    end
  end
end
