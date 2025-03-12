# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save!
      flash[:notice] = 'Task successfully created'
      redirect_to task_path(@task)
    else
      flash.now[:failure] = 'Task cannot be created.'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:notice] = 'Task successfully updated'
      redirect_to task_path(@task)
    else
      flash.now[:failure] = 'Task cannot be updated.'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Task successfully deleted'
      redirect_to tasks_path
    else
      flash.now[:failure] = 'Task cannot be deleted.'
      render :show
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
