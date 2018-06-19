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
    redirect "/#{@host.slug}/events"
  end

  post '/create_host' do
    @host = Host.create(username: params[:username], email: params[:email],password: params[:password])

    redirect "/#{@host.slug}/events"
  end
end
