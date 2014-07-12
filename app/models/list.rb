class List < ActiveRecord::Base
	 has_many :tasks, dependent: :destroy
	 belongs_to :user
	 has_many :favorites
	 has_many :favorite_users, through: :favorites, source: :user
	 validates_presence_of :name
end
