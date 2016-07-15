# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::MobileEngagement
  module Models
    #
    # Used to target devices who received a poll.
    #
    class PollFeedbackCriterion < Criterion

      include MsRestAzure


      def initialize
        @type = "poll-feedback"
      end

      attr_accessor :type

      # @return [Integer] The unique identifier of the poll.
      attr_accessor :content_id

      # @return [CampaignFeedbacks] Action that was performed on the poll.
      # Possible values include: 'pushed', 'replied', 'actioned', 'exited'
      attr_accessor :action


      #
      # Mapper for PollFeedbackCriterion class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'poll-feedback',
          type: {
            name: 'Composite',
            class_name: 'PollFeedbackCriterion',
            model_properties: {
              type: {
                required: true,
                serialized_name: 'type',
                type: {
                  name: 'String'
                }
              },
              content_id: {
                required: false,
                serialized_name: 'content-id',
                type: {
                  name: 'Number'
                }
              },
              action: {
                required: false,
                serialized_name: 'action',
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
