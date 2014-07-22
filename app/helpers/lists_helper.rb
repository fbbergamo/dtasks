module ListsHelper
	def remove_list(list, user = current_user)
		link_to 'Remove', list_path(list), :confirm => 'Are you sure?', :method => :delete, class: "btn btn-danger" if list.user == user
	end
end
