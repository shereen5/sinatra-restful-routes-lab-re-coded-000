class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end
  get '/recipes/new' do
    erb  :new
  end
  get '/recipes/:id/edit' do
    @receipe=Recipe.find_by_id(params[:id])
    session[:id]=@receipe.id
    erb :edit
  end
  post '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
     @recipe.delete
     redirect to '/recipes'
  end
  post '/recipes/:id' do
    @receipe=Recipe.find_by_id(params[:id])
    @recipe.name=params[:name]
    @recipe.cook_time=params[:cook_time]
    @recipe.ingredients=params[:ingredients]
    @recipes.save
    redirect to "/recipes/#{@receipe.id}"
  end
  get '/recipes/:id' do
    @receipe=Recipe.find_by_id(params[:id])
    session[:id]=@receipe.id
    erb :show
  end
  # post '/recipes/:id' do
  #   @receipe=Recipe.find_by_id(params[:id])
  #   session[:id]=@receipe.id
  #   erb :show
  # end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
  get '/recipes' do
    erb  :recipes
  end

end
