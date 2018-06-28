

class ApplicationController < Sinatra::Base
  set :views, Proc.new{File.join(root, "../views/")}
  configure do
  enable :sessions
  set :session_secret, "party_monster"

end

 get '/' do

   erb :index
 end

 helpers do
     def current_user
        Host.find(session[:host_id])
     end

    def logged_in?
      !!session[:host_id]
    end

 end


end
