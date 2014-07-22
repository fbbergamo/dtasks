require 'rails_helper'

RSpec.describe List, :type => :model do
	it { should belong_to(:user) }
	it { should have_many(:favorites) }
	it { should have_many(:favorite_users) }
	it { should have_many(:tasks) }
	it { should validate_presence_of(:name) }

	context "test list scopes" do


		it "list public lists" do
			@public_list = create(:list, public: true, user_id: 99)
			@user = create(:user)
			expect(List.public_lists(@user)).to include(@public_list)
		end

		it "no include private lists" do
			@private_list = create(:list, public: false)
			@user = User.new
			expect(List.public_lists(@user)).not_to include(@private_list)
		end
	end

end
