class ListsController < ApplicationController
	before_action :authenticate_user!

	def index
		@lists = current_user.lists.page(params[:page])
	end

	def bookmarks
		@lists = current_user.favorite_lists.page(params[:page])
	end

	def public
		@lists = List.public_lists.page(params[:page])
	end

	def create
	end

	def destroy
	end

end
