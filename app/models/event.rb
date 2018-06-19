class Event < ActiveRecord::Base
  belongs_to :host
  belongs_to :venue

  def slug
    self.name.split(' ').join('-').downcase
  end

  def self.find_by_slug(event)
    self.all.detect{|e| e.slug == event.downcase}
  end

end
