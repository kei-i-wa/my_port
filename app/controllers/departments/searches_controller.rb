class Departments::SearchesController < ApplicationController
  def index
    @departments = Department.search(params[:dep_keyword])
    @value = params[:dep_keyword]
    respond_to do |format|
      format.json { render 'department/index', json: @departments }
      format.html
    end
  end
end
