class Departments::SearchesController < ApplicationController
  
  def index
  @departments = Department.search(params[:keyword])
  # respond_to do |format|
  #   format.json { render '/departments/search/index', json: @departments } 
  # end
  end
  
end
