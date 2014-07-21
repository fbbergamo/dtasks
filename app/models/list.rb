class List < ActiveRecord::Base
	 belongs_to :user
	 has_many :tasks, dependent: :destroy, :inverse_of => :list
	 has_many :favorites
	 has_many :favorite_users, through: :favorites, source: :user
	 
	 paginates_per 50
	 validates_presence_of :name
	 scope :public_lists, -> (user) { where(public: true).where.not(user_id: user) }
	 scope :authorized, -> (user) { where("user_id = ? or public = ?", user, true) }
	 accepts_nested_attributes_for :tasks
end
