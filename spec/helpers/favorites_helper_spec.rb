require 'rails_helper'

RSpec.describe FavoritesHelper, :type => :helper do
	before(:each) do
		@user = create(:user)
		@user2 = create(:user, email: "j@j.com")
		@list = create(:list, user: @user)
	end
	
	it "can favorite" do
		text = bookmark(@list, @user2)
		expect(text).to match(/Add Bookmark/)
	end

	it "remove button" do
		favorite = create(:favorite, user: @user, list: @list)
		text = remove_button(@list, @user)
		expect(text).to match(/Remove Bookmark/)
	end
end
