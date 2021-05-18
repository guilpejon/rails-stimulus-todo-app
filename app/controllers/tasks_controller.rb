class TasksController < ApplicationController
  layout false

  def index
    @tasks = Task.order('created_at DESC')
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    ActionCable.server.broadcast('tasks_channel', {})
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true)

    ActionCable.server.broadcast('tasks_channel', {})
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
