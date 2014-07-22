class FavoritesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_favorite, only: [:destroy]

	def create
		@list = List.find favorite_params[:list_id]
		current_user.add_favorite(@list)
		respond_to do |format|
		    format.js
		end
	end

	def destroy
		@list = @favorite.list
		@favorite.destroy if @favorite.user == current_user
		respond_to do |format|
		    format.js
		end
	end

	private
	def set_favorite
		@favorite = Favorite.find params[:id]
	end

	def favorite_params
		params.require(:favorite).permit(:list_id)
	end

end
