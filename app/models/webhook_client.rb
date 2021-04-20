class WebhookClient < ActiveRecord::Base
  unloadable
  
  attribute :events, :string, default: ''
  
  validates :target_url, presence: true, format: URI.regexp(%w(http https))
  
  def events=(events)
    events = Array(events).map { |event| event.to_s.underscore }
    super((WebhookEvent::EVENT_TYPES & events).join(','))
  end

  def events
    self[:events].split(',')
  end

  def self.for_event(events)
    events = Array(events)
    where(
      (["events like ?"] * events.count).join(' OR '), 
      *(events.map { |e| "%#{e}%" }))
  end
  
  def deliver(event)
    Webhooks::DeliveryWorker.perform_async(id, event.to_json)
  end
end
