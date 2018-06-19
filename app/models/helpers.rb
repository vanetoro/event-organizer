class Helpers < ActiveRecord::Base
  attr_accessor :host

  def self.current_user(session)
    @host = Host.find(session[:host_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end
