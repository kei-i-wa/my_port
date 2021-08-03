class GroupsController < ApplicationController

  def index
    @group = Group.new
    @group.users << current_user
    @groups = Group.all
  end
  
  def new
  end

  def show
    @group=Group.find(params[:id])
  end
  
  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end

  def create
    @group = current_user.owned_groups.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
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
  
  def destroy
   @group = Group.find(params[:id])
  # current_userは@group_userから消える
   @group.users.delete(current_user)
   redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction,:status,:user_id)
  end
end
