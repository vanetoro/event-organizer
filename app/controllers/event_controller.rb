class EventController < ApplicationController

 get '/new' do
    @venues = Venue.all
   erb :'/events/create_event'
 end

 get '/events/show_all' do
  #  binding.pry
   @events = Event.all

  erb :'/events/all_events'
 end
 get '/events/:slug' do
   if Helpers.current_user(session)
     @event = Event.find_by_slug(params[:slug])
     erb :'/events/show_event'
   else
     redirect '/login'
   end
 end



 get '/edit_event/:slug' do
   @event = Event.find_by_slug(params[:slug])
   erb :'/events/edit_event'
 end


 post '/create_event' do
   @event = Event.create(name: params[:name], date: params[:date])
   @host = Host.find(session[:host_id])
   if !params[:new_venue].empty?
     @venue = Venue.create(name: params[:new_venue],location: params[:location])
        else
     @venue = Venue.find(params[:venue])
   end
     @host.events << @event
     @venue.events << @event

   redirect "/events"
 end

 patch '/edit_event/:slug' do
   @event = Event.find_by_slug(params[:slug])
   @host = Host.find(session[:host_id])
   @event.name = params[:name]
   @event.date = params[:date]
   @event.save
    redirect "/events"
 end

 delete '/delete_event/:slug' do
   @event =  Event.find_by_slug(params[:slug])
   @host = @event.host
   @event.destroy
   redirect "/events"
 end


end
