class SearchController < ApplicationController


  def index
    @searchparam = params[:search].downcase
    @title = "Search Results:"
    @footerposts = Post.order(created_at: :desc).limit(4)

    @searchresult =[]
    @searchresult += Post.where('title like ?', "%#{@searchparam}%")
    @searchresult += Post.find(Author.where('name like ?',"%#{@searchparam}%").ids)
    @searchresult += Post.where('body like ?', "%#{@searchparam}%")
    @searchresult.uniq!

  end


end
