class Groups::SearchesController < ApplicationController
  def index
    @group = Group.new
    @value = params[:group_keyword]
    group = Group.search(params[:group_keyword])
    @groups = group.page(params[:page]).per(12)
    respond_to do |format|
      format.json { render 'groups/index', json: @groups }
      format.html
    end
  end
end
