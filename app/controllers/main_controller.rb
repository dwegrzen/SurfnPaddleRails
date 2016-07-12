class MainController < ApplicationController

attr_accessor :data


  def index
    @recent = Post.order(created_at: :desc).first
    @footerposts = Post.order(created_at: :desc) - [@recent]
    @title = "Surf-N-Paddle Blog"

  end


  def blogs
    @int = params[:postid].to_i
    @selected = Post.find(@int)
    @footerposts = Post.order(created_at: :desc) - [@selected]
    @title = @selected.title
    @header = @selected.id

  end


end
