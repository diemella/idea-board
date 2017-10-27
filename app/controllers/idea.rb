# idea controller

get '/ideas' do
  @ideas = Idea.all
  erb :'/ideas/index'
end

get '/ideas/new' do
  erb :'ideas/new'
end

post '/ideas' do
  @idea = Idea.new( title: params[:title],
                    content: params[:content],
                    public: params[:public],
                    creator_id: current_user.id)
  if @idea.save
    redirect '/users/profile'
  else
    @error = "Something went wrong! Try again..."
    erb :'ideas/new'
  end
end

get '/ideas/:id' do
  @idea = Idea.find(params[:id])
  erb :'ideas/show'
end

get '/ideas/:id/edit' do
  @idea = Idea.find(params[:id])
  erb :'ideas/edit'
end

put '/ideas/:id' do
  @idea = Idea.find(params[:id])
  if @idea.update_attributes(params['idea'])
    redirect '/users/profile'
  else
    @error = "Something went wrong! Try again..."
    erb :'ideas/edit'
  end
end

delete '/ideas/:id' do
  Idea.find(params[:id]).destroy
  redirect '/users/profile'
end

