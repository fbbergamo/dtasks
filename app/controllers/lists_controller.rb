class ListsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_list, only: [:show,  :destroy]
	responders :location, :flash
  	respond_to :html

	def index
		@list = List.new
		index_lists
	end

	def bookmarks
		@lists = current_user.favorite_lists.page(params[:page])
	end

	def public
		@lists = List.public_lists(current_user).page(params[:page])
	end

	def show
		@task = Task.new
		@task.list_id = @list.id
		@tasks = @list.tasks.page(params[:page])
	end

	def create
		@list = List.create(list_params.merge(user: current_user))
		respond_with @list do |format|
			unless @list.valid?
				index_lists
		    	format.html { render "index" }
			end
		end
	end

	def destroy
		@list.destroy
		respond_with @list
	end

	private

	def index_lists
		@lists = current_user.lists.page(params[:page])
		@list.tasks.build
	end

    def set_list
      @list = List.authorized(current_user).find(params[:id])
    end

     def list_params 
      params.require(:list).permit(:name, :public,  tasks_attributes: :text )
    end

end
