class Users::SearchesController < ApplicationController
  def index
    users = User.search(params[:keyword])
    @users = users.page(params[:page]).per(25)
    @departments=Department.all
    respond_to do |format|
      format.json { render 'users/index', json: @users }
      format.html
    end
  end
end
