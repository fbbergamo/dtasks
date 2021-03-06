module ApplicationHelper

	def link_to_add_fields(name, f, association)
    	new_object = f.object.send(association).klass.new
    	id = new_object.object_id
    	fields = f.fields_for(association, new_object, child_index: id) do |builder|
      		builder.input :text, required: false
    	end
    	link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end


  	def nested_messages(messages)
      nested = messages.map do |message, sub_messages|
        render(message) + content_tag(:div, nested_messages(sub_messages), :class => "nested_messages")
      end
      nested.join.html_safe
	end

end
