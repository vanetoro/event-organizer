class Event < ActiveRecord::Base
  belongs_to :host
  belongs_to :venue

  def slug
    self.name.split(' ').join('-').downcase
  end

  def Event.find_by_slug(event)
    Event.all.detect{|e| e.slug == event.downcase}
  end

end
