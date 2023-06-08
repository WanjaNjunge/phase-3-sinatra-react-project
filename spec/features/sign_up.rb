require 'sinatra'

$users = []

get '/' do
    erb :index
end

post '/signup' do
    email = params [:email]
    password = params[:password]

    # Basic Validation

    if email.empty? || password.empty?
        @error = 'Please input an email and a password'
        erb :index
    else
        # Check if email is already in use

        if $emails.any? { |email|email[:email] == email }
            @error = 'Email already registered!!'
            erb :index
        else
            # Store User Data

            $emails << { email: email, password: password }
            redirect '/success'
        end
    end
end

get '/success' do
    erb :success
end