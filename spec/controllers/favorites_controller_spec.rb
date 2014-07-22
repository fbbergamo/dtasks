require 'rails_helper'

RSpec.describe FavoritesController, :type => :controller do
	login_user

	it "should create" do
		FavoritesController.any_instance.stub(:add_favorite)
		list = create(:list, user_id: subject.current_user.id)
		post :create, favorite: { list_id: list.id }, format: :js
		expect(response.status).to eq(200)
	end

	it "should delete" do
		user = create(:user, email: "f@f.com.br")
		list = create(:list, user_id: user.id)
		favorite = create(:favorite, user: subject.current_user, list: list)
		delete :destroy, id: favorite.id , format: :js
		expect(response.status).to eq(200)
	end
end
