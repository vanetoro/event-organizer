class Event < ActiveRecord::Base
  belongs_to :host
  has_many :events

  def slug
    self.event_name.split(' ').join('-').downcase
  end

  def Event.find_by_slug(event)
    Event.all.detect{|e| e.slug == event}
  end

end
