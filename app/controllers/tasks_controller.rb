class TasksController < ApplicationController
  layout false

  def index
    @tasks = Task.order('created_at DESC')
  end
end
