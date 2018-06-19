class HostController < ApplicationController

  get '/login' do
    if Helpers.logged_in?(session)
      @host = Host.find(session[:host_id])
      redirect "/#{@host.slug}/events"
    else
      erb :'/hosts/login'
    end
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
    if @host
    session[:host_id] = @host.id
    redirect "/#{@host.slug}/events"
    else
      redirect '/login'
    end
  end

  post '/create_host' do
    @host = Host.create(username: params[:username], email: params[:email],password: params[:password])
    session[:host_id] = @host.id
    redirect "/#{@host.slug}/events"
  end
end
