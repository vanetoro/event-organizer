class ApplicationController < Sinatra::Base
  set :views, Proc.new{File.join(root, "../views/")}

 get '/' do

   erb :index
 end
 I made a change to this File this is a change

end
