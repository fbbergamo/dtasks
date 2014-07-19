class TasksController < ApplicationController
	before_action :authenticate_user!
	before_action :set_task, only: [:destroy]

	def create
		@task = Task.create task_params
		respond_with @task
	end

	def destroy
		@task.destroy_recusive
		respond_with @task
	end

	private
    def set_task
    	@task = Task.find params[:id]
    end

    def task_params
      params.require(:task).permit(:title, :parent_id)
    end
end
