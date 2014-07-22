require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ListsHelper. For example:
#
# describe ListsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ListsHelper, :type => :helper do
  	it "remove list link" do
  		user = create(:user)
  		list = create(:list, user: user)
  		link = remove_list(list, user)
  		expect(link).to match(/Remove/)
  	end
end
