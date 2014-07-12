class Favorite < ActiveRecord::Base
	belongs_to :user
	belongs_to :list
	validates_uniqueness_of :user_id, scope: :list_id
	validates_presence_of :user, :list
end
