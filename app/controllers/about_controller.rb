class AboutController < ApplicationController

  def index
    @title = "About Surf-N-Paddle"
    @footerposts = Post.order(created_at: :desc).limit(4)  
  end


end
