# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Logic
  module Models
    #
    # Model object.
    #
    class IntegrationAccountPartnerFilter

      include MsRestAzure

      # @return [PartnerType] The partner type of integration account partner.
      # Possible values include: 'NotSpecified', 'B2B'
      attr_accessor :partner_type


      #
      # Mapper for IntegrationAccountPartnerFilter class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'IntegrationAccountPartnerFilter',
          type: {
            name: 'Composite',
            class_name: 'IntegrationAccountPartnerFilter',
            model_properties: {
              partner_type: {
                required: false,
                serialized_name: 'partnerType',
                type: {
                  name: 'Enum',
                  module: 'PartnerType'
                }
              }
            }
          }
        }
      end
    end
  end
end
