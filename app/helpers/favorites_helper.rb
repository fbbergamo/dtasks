module FavoritesHelper

	def bookmark(list, user = current_user)
		if user.can_favorite? list
			user.favorite(list) ? remove_button(list) : add_button(list)
		end
	end

	def remove_button(list, user = current_user)
		link_to 'Remove Bookmark', favorite_path(user.favorite(list)), 
				:confirm => 'Are you sure?', :method => :delete, :remote => true, class: "remove-bookmark btn btn-default"
	end

	def add_button(list)
		render(partial: "favorites/form", locals: {list: list})
	end
end
