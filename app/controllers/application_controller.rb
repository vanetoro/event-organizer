class ApplicationController < Sinatra::Base
  set :views, Proc.new{File.join(root, "../views/")}
  configure do
  enable :sessions
  set :session_secret, "party_monster"
end

 get '/' do

   erb :index
 end


end
