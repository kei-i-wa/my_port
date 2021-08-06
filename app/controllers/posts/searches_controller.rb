class Posts::SearchesController < ApplicationController
  def index
    posts=Post.search(params[:posts_keyword])
    @posts=posts.page(params[:page]).per(25)
    @tag_list=Tag.order('id DESC').limit(20)
     respond_to do |format|
       format.json{render'posts/index',json: @posts}
        format.html
     end
  end

end