class Host < ActiveRecord::Base
  has_many :events
  has_secure_password

  def slug
    self.username.split(' ').join('-').downcase
  end

  def Host.find_by_slug(host)
    Host.all.detect{|h| h.slug == host}
  end
end
