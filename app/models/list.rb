class List < ActiveRecord::Base
	 belongs_to :user
	 has_many :tasks, dependent: :destroy
	 has_many :favorites
	 has_many :favorite_users, through: :favorites, source: :user
	 
	 validates_presence_of :name

	 scope :public_lists, -> { where(public?: true) }

end
