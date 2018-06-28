# class Helpers < ActiveRecord::Base
#   attr_accessor :host
#
#   def self.current_user(session)
#     @host = Host.find(session[:host_id])
#   end
#
#   def self.logged_in?(session)
#     !!session[:host_id]
#   end
# end
#

# def self.find_by_session(session)
#   binding.pry
#   @host = Host.find(session[:host_id])
# end
