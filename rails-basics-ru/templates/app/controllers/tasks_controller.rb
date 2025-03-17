class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
      flash[:notice] = 'Task successfully created'
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
      flash[:notice] = 'Task successfully edited'
    else
      render :show
      flash.now[:failure] = 'Task cannot be created.'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Task successfully deleted'
      redirect_to tasks_path
    else
      flash.now[:failure] = 'Task cannot be deleted.'
      redirect_to task_path(@task)
    end
  end

  private
  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
