class EventController < ApplicationController

 get '/new' do

   erb :'/events/create_event'
 end

 get '/events/all' do
   @events = Event.alld
  erb :'/events/all_events'
 end

 get '/events/new' do

   erb :'/events/create_event'
 end

 get '/events/:slug' do
   @event = Event.find_by_slug(params[:slug])

   erb :'/events/show_event'
 end

 post '/events' do
   @event = Event.create(params)
   # user?
   redirect '/'
end


end
