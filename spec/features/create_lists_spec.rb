require 'rails_helper'

RSpec.describe "CreateLists", :type => :request do
  describe "GET /create_lists" do

    it "fill list" do
    	create(:user)
    	visit '/users/sign_in'
 		within("#new_user") do
	      fill_in 'Email', :with => 'test@exmaple.com.br'
	      fill_in 'Password', :with => '1234'
	    end
	    click_button 'Sign in'
	    expect(page).to have_content 'My Lists'
	    first('.add_fields').click
	    within("#new_list") do
	      fill_in 'Name', :with => 'teste'
	    end
	    click_button 'Create List'
	    expect(page).to have_content 'teste'
    end


    it "bookmark list" do
    	user = create(:user)
    	user2 = create(:user, email: "f@f.com")
    	list = create(:list, user: user2, name: "lista 1", public: true)
    	visit '/users/sign_in'
 		within("#new_user") do
	      fill_in 'Email', :with => 'test@exmaple.com.br'
	      fill_in 'Password', :with => '1234'
	    end  
	    click_button 'Sign in'
	    visit '/lists/public'
	    expect(page).to have_content 'lista 1'
    end

  end
end
