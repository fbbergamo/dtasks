require 'rails_helper'

RSpec.describe List, :type => :model do
	it { should belong_to(:user) }
	it { should have_many(:favorites) }
	it { should have_many(:favorite_users) }
	it { should have_many(:tasks) }
	it { should validate_presence_of(:name) }

	context "test list scopes" do
		it "list public lists" do
			@public_list = create(:list, public?: true)
			expect(List.public_lists).to include(@public_list)
		end

		it "no include private lists" do
			@private_list = create(:list, public?: false)
			expect(List.public_lists).not_to include(@private_list)
		end
	end

end
