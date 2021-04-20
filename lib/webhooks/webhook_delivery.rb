module Webhooks
  module WebhookDelivery
    extend ActiveSupport::Concern
    
    def deliver_webhook_event(event_name, payload)
      event = WebhookEvent.new(event_name, payload || {})
      WebhookClient.for_event(event_name).each do |endpoint|
        endpoint.deliver(event)
      end
    end

    def webhook_payload
      {}
    end

    def deliver_webhook(action)
      event_name = "#{self.class.name.underscore}_#{action}"
      deliver_webhook_event(event_name, webhook_payload)
    end
  end
end
