require 'rack-flash'

class HostController < ApplicationController
  use Rack::Flash

  get '/login' do
    if logged_in?
      current_user
      redirect "/events"
    else
      erb :'/hosts/login'
    end
  end

  get '/signup' do
    if logged_in?
      current_user
      redirect "/events"
    else
      erb :'/hosts/signup'
    end
  end

  get '/events' do
    @host = current_user
    if logged_in?
      @events = @host.events
      erb :'/hosts/events'
    else
      redirect '/login'
    end
  end

  get '/edit' do
    @host = current_user
    if logged_in?
      @events = @host.events
      erb :'/hosts/edit_host'
    else
      redirect '/login'
    end
  end

  patch '/edit' do
    @host = current_user
    if logged_in?
      @host.username = params[:username]
      @host.email = params[:email]
      @host.password = params[:password]
      @host.save
      redirect '/events'
    else
      redirect '/login'
    end
  end

  post '/events' do
      @host = Host.find_by_slug(params[:username])
    if @host == nil
      flash[:message] = "We don't have a user with the username please signup first"
      redirect '/signup'
    end
    if @host.authenticate(params[:password])
    session[:host_id] = @host.id
    redirect "/events"
    else
      redirect '/login'
    end
  end

  post '/create_host' do
    if Host.find_by(username: params[:username])
      flash[:message] = 'Username is already taken please try another one'
      redirect '/signup'
    elsif Host.find_by(email: params[:email])
      flash[:message] = 'E-mail is already taken please try another one'
      redirect '/signup'
    else
      @host = Host.create(username: params[:username], email: params[:email],password: params[:password])
      session[:host_id] = @host.id
      redirect "/events"
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end
