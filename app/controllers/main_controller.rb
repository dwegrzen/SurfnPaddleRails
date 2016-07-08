class MainController < ApplicationController

attr_accessor :data


  def index
    @data = Post.all
    @footerposts = @data.sort_by{|x| x.id}.select{|post| post.id != @data.last.id}
  end


  def blogs
    @data = Post.all
    @int = params[:postid].to_i
    @selected = Post.find(@int)
    @footerposts = @data.select{|post| post.id != params[:postid].to_i}
  end

end
