require 'rails_helper'

RSpec.describe User, :type => :model do
	it { should have_many(:favorites) }
	it { should have_many(:favorite_lists) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }

	context "user and favorite" do
		  before(:each) do
		    @user = create(:user)
		  end

		it "can favortie list" do
		    list = create(:list, public: true)
			expect(@user.can_favorite?(list)).to be_truthy
		end

		it "can't favorite list not public" do
			list = create(:list, public: false)
			expect(@user.can_favorite?(list)).to be_falsey
		end

		it "can't favorite own users list" do
			list = create(:list, user_id: @user.id)
			expect(@user.can_favorite?(list)).to be_falsey
		end

		it "should create favorite" do
			list = create(:list, public: true)
			favorite = @user.add_favorite(list)
			expect(favorite).to be_a_kind_of(Favorite)  
		end

		it "shouldn't create favorite" do
			list = create(:list, public: false)
			favorite = @user.add_favorite(list)
			expect(favorite).to be_nil  
		end

	end

end
