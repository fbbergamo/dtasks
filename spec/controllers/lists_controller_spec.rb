require 'rails_helper'

RSpec.describe ListsController, :type => :controller do
	login_user

	it "shoud get index" do
		get :index
		expect(response.status).to eq(200)
	end

	it "shoud get bookmarks" do
		get :bookmarks
		expect(response.status).to eq(200)
	end

	it "shoud get public" do
		get :public
		expect(response.status).to eq(200)
	end

	it "shoud get public" do
		@list = create(:list, user: subject.current_user)
		get :show, id: @list.id
		expect(response.status).to eq(200)
	end

	it "shoud create" do 
		post :create, list: { name: "list", public: true }
		expect(response.status).to eq(302)
	end

	it "should destroy" do
		@list = create(:list, user: subject.current_user)
		delete :destroy, id: @list.id
		expect(response.status).to eq(302)
	end
end
