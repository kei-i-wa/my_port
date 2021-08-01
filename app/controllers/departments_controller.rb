class DepartmentsController < ApplicationController
  
  
  def index
    @department=Department.new
    @departments=Department.all
  end

  def create
    @department=Department.new(department_params)
    if @department.save
    redirect_to request.referer,notice:"登録完了しました！"
    else
    render :index
    end
  end

  def edit
    @department=Department.find(params[:id])
  end

  def update
    @department=Department.find(params[:id])
    if @department.update(department_params)
      redirect_to departments_path,notice:"更新完了しました"
    else
      render:edit
    end
  end
  
  private
  
  def department_params
    params.require(:department).permit(:name,:correct_name)
  end
end
