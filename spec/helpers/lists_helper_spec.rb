require 'rails_helper'

RSpec.describe ListsHelper, :type => :helper do
  	it "remove list link" do
  		user = create(:user)
  		list = create(:list, user: user)
  		link = remove_list(list, user)
  		expect(link).to match(/Remove/)
  	end
end
