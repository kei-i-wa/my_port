class GroupsController < ApplicationController

  def index
    @group = Group.new
    @groups = Group.all
  end
  
  def new
  end

  def show
    @group=Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'index'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render"edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction,:status)
  end
end
