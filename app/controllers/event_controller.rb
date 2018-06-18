class EventController < ApplicationController

 get '/new' do

   erb :'/events/create_event'
 end

 get '/events/all' do
   @events = Event.all
   binding.pry
  erb :'/events/all_events'
 end

end
