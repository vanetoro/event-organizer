class EventController < ApplicationController

 get '/new' do
   @venues = Venue.all
   erb :'/events/create_event'
 end

 get '/events/all' do
   @events = Event.all
  erb :'/events/all_events'
 end

 get '/events/new' do

   erb :'/events/create_event'
 end

 get '/events/:slug' do
   @event = Event.find_by_slug(params[:slug])

   erb :'/events/show_event'
 end

 post '/create_event' do
   binding.pry
   @event = Event.create(params)

   redirect '/'
end


end
