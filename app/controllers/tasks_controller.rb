class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only: [:destroy]
	responders :location, :flash
  	respond_to :html

	def create
		@list = current_user.lists.find task_params[:list_id]
		@task = @list.tasks.create task_params
		respond_with @task, location: -> { list_path(@task.list) } do |format|
			unless @task.valid?
				@tasks = @list.tasks
		    	format.html { render "lists/show" }
			end
		end
	end

	def destroy
		@task.destroy_recusive
		respond_with @task, location: list_path(@task.list)
	end

	private
    def set_task
    	@task = Task.by_user(current_user, params[:id])
    end

    def task_params
      params.require(:task).permit(:text, :parent_id, :list_id)
    end
end
