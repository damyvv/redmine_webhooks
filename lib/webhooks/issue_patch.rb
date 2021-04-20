module Webhooks
  module IssuePatch
    extend ActiveSupport::Concern
    include Webhooks::WebhookDelivery

    included do
      after_commit on: :update do
        deliver_webhook(:updated)
      end
    end

    private
      def webhook_payload
        issue = self.as_json
        issue[:closed] = self.closed?
        { issue: issue }
      end
  end
end
