module FavoritiesHelper

	def bookmark(list, user = current_user)
		if user.can_favorite? list
			user.favorite(list) ? remove_button(list) : add_button(list)
		end
	end

	def remove_button(list, user = current_user)
		link_to 'Remove Bookmark', favority_path(user.favorite(list)), 
				:confirm => 'Are you sure?', :method => :delete, :remote => true, class: "remove-bookmark btn btn-default"
	end

	def add_button(list)
		render(partial: "favorities/form", locals: {list: list})
	end
end
