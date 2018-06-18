class HostController < ApplicationController

  get '/login' do

  erb :'/hosts/login'
  end

  get '/signup' do

  erb :'/hosts/signup'
  end

  get '/events/:slug/all' do
  @host = Host.find_by_slug(params[:slug])
  @events = @host.events

  erb :'/hosts/events'
  end

  post '/events' do
    @host = Host.find_by(username: params[:username])
    redirect "/events/#{@host.slug}/all"
  end

  post '/create_host' do
    @host = Host.create(params)
    redirect '/events'
  end
end
