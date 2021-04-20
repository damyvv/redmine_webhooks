class WebhookEvent
  unloadable
  
  EVENT_TYPES = %w(
    issue_updated
  ).freeze
  
  attr_reader :event_name, :payload
  
  def initialize(event_name, payload = {})
    @event_name = event_name
    @payload = payload
  end
  
  def as_json(*args)
    hash = payload.dup || {}
    hash[:event_name] = event_name
    hash
  end
end
