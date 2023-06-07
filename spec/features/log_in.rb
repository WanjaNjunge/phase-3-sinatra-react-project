require 'sinatra'

enable :sessions

# In-memory database

USERS = {
    'email1' => 'password1',
    'email2' => 'password2',
    'email3' => 'password3'
}

# Method to check if user is authenticated
def authenticated?
    session[:authenticated]
end

# Method to authenticate a user
def authenticate(email, password)
    USERS[email] == password
end

# Login Route

get '/login' do
    erb :login
end

# Login form submission

post '/login' do
    email = params[:email]
	password = params[:password]

    if authenticate(email, password)
        session[:authenticated] = true
        session[:email] = email
    else
        erb :login
    end
end

# Logout route
get '/logout' do
    session[:authenticated] = false
    session[:email] = nil
    redirect '/login'
end