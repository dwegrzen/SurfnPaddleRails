class AboutController < ApplicationController

  def index
    @title = "About Surf-N-Paddle"
    @data = Post.all
    @footerposts = @data.sort_by{|x| x.created_at}.reverse.shift(4)    
  end


end
