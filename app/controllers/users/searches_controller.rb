class Users::SearchesController < ApplicationController
  def index
  users= User.search(params[:keyword])
  @users=users.page(params[:page]).per(25)
  respond_to do |format|
    # format.json { render 'index', json: @users }
    format.html
    format.json
  end
  end

end
