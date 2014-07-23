require 'rails_helper'

RSpec.describe "CreateLists", :type => :request do
  describe "GET /create_lists" do

    it "fill list and task", :js => true  do
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
	      fill_in 'Text', :with => 'task 1'
	    end
	    click_button 'Create List'
	    expect(page).to have_content 'teste'
	    expect(page).to have_content 'task 1'
    end


    it "bookmark list", :js => true  do
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
	    expect(page).to have_button 'Add Bookmark'
	    click_button "Add Bookmark"
	    expect(page).to have_content 'Remove Bookmark'
    end

  end
end
