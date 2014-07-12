require 'rails_helper'

RSpec.describe User, :type => :model do
	it { should have_many(:favorites) }
	it { should have_many(:favorite_lists) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
end
