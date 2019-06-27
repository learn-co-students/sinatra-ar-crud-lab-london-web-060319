
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/articles"
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    @article = Article.new
    erb :new
  end


  post "/articles" do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # Find an article by ID and update it DB entry 
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  # Delete the article by ID and redirect to the article index page
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end
