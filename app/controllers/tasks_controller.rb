class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  
  def index
    @tasks = Task.all
  end

  def show
    #@task = Task.find(params[:id])
  end

  def new
     @task = Task.new
  end

  def create
    
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'task が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が作成されませんでした'
      render :new
    end
    
  end

  def edit
    #@task = Task.find(params[:id])
  end

  def update
    
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでしたand'
      render :edit
    end
    
  end

  def destroy
    
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
    
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end


  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
  
end
