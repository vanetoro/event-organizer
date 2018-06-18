class EventController < ApplicationController

 get '/new' do

   erb :'/events/create_event'
 end

 get '/events/all' do
   @events = Event.all
  erb :'/events/all_events'
 end

 get '/events/new' do

   erb :'/events/create_event'
 end

end
