class TasksController < ApplicationController
  def index
    @tasks = Task.all 
    @date = Date.today
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo))
    if @task.save
      flash[:save_success] = "登録しました"
      redirect_to :tasks
    else
      flash[:save_failure] = "登録に失敗しました"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task =Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo))
      flash[:save_success] = "「#{@task.id}」の情報を更新しました"
      redirect_to :tasks
    else
      flash[:save_failure] = "編集に失敗しました"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = "スケジュールを削除しました"
      redirect_to :tasks
  end
  
end