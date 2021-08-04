class Posts::SearchesController < ApplicationController
  def index
    posts=Post.search(params[:keyword])
    @posts=posts.page(params[:page]).per(25)
    @tag_list=Tag.all
  end
end
