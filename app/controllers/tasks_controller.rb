class TasksController < ApplicationController
  layout false

  def index
    @tasks = Task.order('created_at DESC')
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
