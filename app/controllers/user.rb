# user controller

# register
get '/users/register' do
  erb :'users/register'
end

post '/users' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Invalid input!"
    erb :'/users/register'
  end
end


# login

get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Invalid input!"
    erb :'/users/login'
  end
end

# logout
get '/users/logout' do
  session.delete(:user_id)
  redirect '/'
end

# profile

get '/users/profile' do
  if current_user
    @ideas = current_user.ideas
    erb :'/users/profile'
  else
    redirect '/users/login'
  end
end
