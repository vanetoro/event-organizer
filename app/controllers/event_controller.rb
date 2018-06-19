class EventController < ApplicationController

 get '/new' do
   @venues = Venue.all
   erb :'/events/create_event'
 end

 get '/events/:slug' do
   @event = Event.find_by_slug(params[:slug])
   erb :'/events/show_event'
 end

 get '/events/show_all' do
   @events = Event.all
  erb :'/events/all_events'
 end


 post '/create_event' do
   @event = Event.create(name: params[:name], date: params[:date])
   if !params[:venue].empty?
     Venue.find(params[:venue])
   else
     Venue.create(name: params[:new_venue],location: params[:location])
   end
   redirect "/:slug/events"
 end


 delete '/delete_event/:slug' do
   @event =  Event.find_by_slug(params[:slug])
   @host = @event.host
   @event.destroy
   redirect "/#{@host.slug}/events"
 end


end
