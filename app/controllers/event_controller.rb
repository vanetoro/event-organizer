require 'rack-flash'

class EventController < ApplicationController
  use Rack::Flash

 get '/new' do
    @host = Helpers.current_user(session)
    @venues = Venue.all
   erb :'/events/create_event'
 end

 get '/events/show_all' do
   @events = Event.all

  erb :'/events/all_events'
 end

 get '/events/:slug' do
     @event = Event.find_by_slug(params[:slug])

     @host = Host.find(session[:host_id])
     erb :'/events/show_event'
 end


 post '/events/create_event' do
   if params[:name].empty? || params[:date].empty?
     flash[:message] = 'Please make sure to enter Event name and date'
     redirect '/new'
   else
     @event = Event.create(name: params[:name], date: params[:date])
     @host = Host.find(session[:host_id])
  end
   if params[:new_venue].empty? && params[:venue] == nil
     flash[:message] = 'Please make sure to choose a venue or enter a new venue'
     redirect '/new'
   elsif !params[:new_venue].empty?
     @venue = Venue.create(name: params[:new_venue],location: params[:location])
   else
     @venue = Venue.find(params[:venue])
   end
     @host.events << @event
     @venue.events << @event
     flash[:message] = 'You have successfully added a new event!'
     redirect "/events"
 end


 get '/events/:slug/edit' do
    @event = Event.find_by_slug(params[:slug])
   if Helpers.logged_in?(session) && Helpers.current_user(session).id == @event.host_id
     @venues = Venue.all
     erb :'/events/edit_event'
   else
    redirect '/events'
   end
 end

 patch '/events/:slug' do
   @event = Event.find_by_slug(params[:slug])
   @host = Host.find(session[:host_id])
   if Helpers.logged_in?(session) && Helpers.current_user(session).id == @event.host_id
     @event.name = params[:name]
     @event.date = params[:date]
      if  !params[:new_venue].empty?
        @event.venue = Venue.create(name: params[:new_venue],location: params[:location])
      else
        @event.venue = Venue.find(params[:venue])
      end
     @event.save
     flash[:message] = 'Successfully updated event.'
     redirect "/events"
   else
     flash[:message] = 'You cannot edit this event'
     redirect "/events"
   end
 end

 delete '/events/:slug/delete' do
   @event =  Event.find_by_slug(params[:slug])
   @host = @event.host
   if @host.id == Helpers.current_user(session).id
     @event.destroy
     flash[:message] = 'You successfully deleted this event.'
     redirect "/events/"
   else
     redirect '/events'
   end
 end

end
