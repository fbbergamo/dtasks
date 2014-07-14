require 'rails_helper'

RSpec.describe Task, :type => :model do
	it { should belong_to(:list) }
	it { should validate_presence_of(:text) }
	it { should validate_presence_of(:list) }

	context "ancestry" do
		before(:each) do
		    @list = create(:list)
		    @root = create(:task, list: @list, text: "task root")
		    @child = create(:task, list: @list, text: "child", parent: @root)
		end

		it "should get last child before delete" do
			nodes = @child.nodes_to_remove
			expect(nodes.find { |item| item[:id] == @root.id }).to_not be_nil
		end

		it "shouldn't get last child before delete" do
			secound_child = create(:task, list: @list, text: "child 2", parent: @root)
			nodes = secound_child.nodes_to_remove
			expect(nodes.size).to eq(0)
		end

		it "puts node diferent list from parent" do
			second_list = create(:list)
			secound_child = build(:task, list: second_list, text: "child 2", parent: @root)
			secound_child.valid?
			expect(secound_child.errors[:ancestry]).to_not be_nil
		end

		it "should get last child before delete recusive" do
			secound_child = create(:task, list: @list, text: "child 2", parent: @child)
			nodes = secound_child.nodes_to_remove
			expect(nodes.size).to eq(2)
		end

		it "parent should destroy child" do
			id = @child.id
			Task.uncached do
				@root.destroy
				expect{ Task.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
			end
		end
	end
end
