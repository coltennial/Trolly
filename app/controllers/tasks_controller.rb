class TasksController < ApplicationController
  before_action :set_task
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all_tasks(current_user.id)
  end

  def show
  end

  def new
    @task = @task.tasks.new
  end

  def edit
  end

  def create
    Task.create_task(task_params)
    redirect_to task_tasks_path
  end

  def update
    Task.update_task(@task.id, task_params)
  end

  def destroy
    Task.delete_task(@task.id)
    redirect_to task_tasks_path
  end

  private 

    def set_task
      @task = task.find(params[:task_id])
    end

    def set_task 
      @task = task.single_task(params[:id])
    end 

    def task_params 
      params.require(:task).permit(:name, :tasks_attributes => [:name])
    end
end
