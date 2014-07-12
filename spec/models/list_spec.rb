require 'rails_helper'

RSpec.describe List, :type => :model do
	it { should belong_to(:user) }
	it { should have_many(:favorites) }
	it { should have_many(:favorite_users) }
	it { should have_many(:tasks) }
	it { should validate_presence_of(:name) }
	
end
