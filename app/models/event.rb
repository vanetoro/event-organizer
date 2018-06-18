class Event < ActiveRecord::Base
  belongs_to :host

  def slug
    self.event_name.split(' ').join('-').downcase
  end

end
