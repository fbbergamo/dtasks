class ListsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_list, only: [:show,  :destroy]
	responders :flash, :http_cache

	def index
		@lists = current_user.lists.page(params[:page])
		@list = List.new
		@list.tasks.build
	end

	def bookmarks
		@lists = current_user.favorite_lists.page(params[:page])
	end

	def public
		@lists = List.public_lists.page(params[:page])
	end

	def show
		@tasks = @list.tasks.page(params[:page])
	end

	def create
		@list = List.create(list_params.merge(user: current_user))
		puts @list.errors.to_json
		respond_with @list
	end

	def destroy
		@list.destroy
		respond_with @list
	end

	private
    def set_list
      @list = List.find(params[:id])
    end

     def list_params 
      params.require(:list).permit(:name, :public,  tasks_attributes: :text )
    end

end
