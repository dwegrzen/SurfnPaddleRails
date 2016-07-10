class SearchController < ApplicationController


  def index
    @searchparam = params[:search].downcase
    @title = "Search Results:"
    @data = Post.all
    @footerposts = @data.sort_by{|x| x.created_at}.reverse.shift(4)

    @searchresult =[]
    @searchresult += @data.select{|x| x.title.downcase.include?(@searchparam)}
    @searchresult += @data.select{|x| x.author.downcase.include?(@searchparam)}
    @searchresult += @data.select{|x| x.body.downcase.include?(@searchparam)}
    @searchresult.uniq!

  end


end
