require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  # new task method
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # create task method
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end

  # show task method
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  # edit task method
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update task method
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  #destroy task method
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
