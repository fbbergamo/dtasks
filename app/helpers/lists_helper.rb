module ListsHelper
	def remove_list(list)
		link_to 'Remove', list_path(list), :confirm => 'Are you sure?', :method => :delete if list.user == current_user
	end
end
