get '/' do
  @ideas = Idea.where(public: true)
  erb :index
end
