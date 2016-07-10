class MainController < ApplicationController

attr_accessor :data


  def index
    @data = Post.all
    @recent = @data.sort_by{|x| x.created_at}.last
    @footerposts = @data.sort_by{|x| x.created_at}.reverse.select{|post| post.id != @recent.id}
    @title = "Surf-N-Paddle Blog"

  end


  def blogs
    @data = Post.all
    @int = params[:postid].to_i
    @selected = Post.find(@int)
    @footerposts = @data.select{|post| post.id != params[:postid].to_i}.sort_by{|x| x.created_at}.reverse
    @title = @selected.title
    @header = @selected.id

  end


end
