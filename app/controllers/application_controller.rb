
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end
end
