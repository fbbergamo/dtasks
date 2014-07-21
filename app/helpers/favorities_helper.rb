module FavoritiesHelper

	def bookmark(list)
		current_user.favorite(list) ? remove_button(list) : add_button(list) if current_user.can_favorite? list
	end

	def remove_button(list)
		link_to 'Remove Bookmark', favority_path(current_user.favorite(list)), 
				:confirm => 'Are you sure?', :method => :delete, :remote => true, class: "remove-bookmark"
	end

	def add_button(list)
		render(partial: "favorities/form", locals: {list: list})
	end
end
