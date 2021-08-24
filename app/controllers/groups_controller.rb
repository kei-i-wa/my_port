class GroupsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def index
    @group = Group.new
    @group.users << current_user
    @groups = Group.page(params[:page]).per(20)
  end

  def new; end

  def show
    @group = Group.find(params[:id])
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  group_path(@group)
  end

  def create
    @group = current_user.owned_groups.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      redirect_to group_path(@group), notice: '投稿完了しました:)'
    else
      @groups = Group.page(params[:page]).per(20)
      render 'index'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path, notice: '更新完了しました:)'
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    # current_userは@group_userから消える
    @group.users.delete(current_user)
    redirect_to group_path(@group)
  end

  def all_destroy
    @group = Group.find(params[:group_id])
    redirect_to groups_path if @group.destroy
  end

  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_mail
    @group = Group.find(params[:group_id])
    group_users = @group.users
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    ContactMailer.send_mail(@mail_title, @mail_content, group_users).deliver
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :status, :user_id)
  end

  def correct_user
    @group = Group.find(params[:id])
    # 今のユーザーがpostのユーザーと違うなら
    if current_user.id != @group.owner_id
      redirect_to groups_path
    end
  end
end
