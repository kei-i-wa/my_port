class Departments::SearchesController < ApplicationController
  
  def index
  @departments = Department.search(params[:keyword])
  end
  
  
end
