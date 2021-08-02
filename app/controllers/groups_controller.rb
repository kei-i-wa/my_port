class GroupsController < ApplicationController
  
  def index
    @groups=Group.page(params[:page]).per(10)
  end
  
  def new
    @group=Group.new
  end
  
  def show
    @group=Group.find(params[:id])
  end
  
  def create
    @group=Group.new(group_params)
    @group.owner_id=current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'index'
    end
  end

  def edit
  end
  
  def update
    if @groups.update(group_params)
      redirect_to group_path
    else
      render"edit"
    end
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end
end
