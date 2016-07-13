class SearchController < ApplicationController


  def index
    @searchparam = params[:search].downcase
    @title = "Search Results:"
    @footerposts = Post.order(created_at: :desc).limit(4)

    @authorids = Author.where('name like ?',"%#{@searchparam}%").ids
    @searchresult =[]
    @searchresult += Post.where('author_id = ?', @authorids)
    @searchresult += Post.where('title like ?', "%#{@searchparam}%")
    @searchresult += Post.where('body like ?', "%#{@searchparam}%")
    @searchresult.uniq!

  end


end
