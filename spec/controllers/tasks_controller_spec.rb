require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
	login_user

	it "should create" do
		list = create(:list, user_id: subject.current_user.id)
		post :create, task: { list_id: list.id, text: "task 1"}
		expect(response.status).to eq(302)
	end

	it "should delete" do
		list = create(:list, user_id:  subject.current_user.id)
		task = create(:task, list_id: list.id, text: "task 1")
		delete :destroy, id: task.id
		expect(response.status).to eq(302)
	end
end
