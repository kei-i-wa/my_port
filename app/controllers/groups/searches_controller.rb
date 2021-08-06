class Groups::SearchesController < ApplicationController

  def index
    @group=Group.new
    groups=Group.search(params[:group_keyword])
    @groups=groups.page(params[:page]).per(12)
      respond_to do |format|
        format.json{render'groups/index',json:@groups}
          format.html
    end
  end
end

