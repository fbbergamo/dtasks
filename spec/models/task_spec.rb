require 'rails_helper'

RSpec.describe Task, :type => :model do
	it { should belong_to(:list) }
	it { should validate_presence_of(:text) }
end
