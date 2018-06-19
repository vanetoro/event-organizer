class Helpers < ActiveRecord::Base
  attr_accessor :host

  def self.current_user(session)
    @host = Host.find(session[:host_id])
  end

  def self.logged_in?(session)
    !!session[:user_id]
  end
end
