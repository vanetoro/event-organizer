class HostController < ApplicationController

  get '/login' do

  erb :'/hosts/login'
  end

  get '/signup' do

  erb :'/hosts/signup'
  end

  get '/:slug/events' do
  @host = Host.find_by_slug(params[:slug])
  @events = @host.events

  erb :'/hosts/events'
  end

  post '/events' do
    @host = Host.find_by_slug(params[:username])
    session[:host_id] = @host.id
    redirect "/#{@host.slug}/events"
  end

  post '/create_host' do
    @host = Host.create(username: params[:username], email: params[:email],password: params[:password])
    session[:host_id] = @host.id
    binding.pry
    redirect "/#{@host.slug}/events"
  end
end
