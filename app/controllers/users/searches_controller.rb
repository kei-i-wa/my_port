class Users::SearchesController < ApplicationController
  def index
    users = User.search(params[:keyword])
    @value = params[:keyword]
    @users = users.where(is_valid: true).page(params[:page]).per(12)
    @departments = Department.all
    respond_to do |format|
      format.json { render 'users/index', json: @users }
      format.html
    end
  end
end
