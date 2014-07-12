class User < ActiveRecord::Base
  	devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

  	has_many :lists
  	has_many :favorites
	has_many :favorite_lists, through: :favorites, source: :list

	def add_favorite(list)
		Favorite.create(user: self, list: list) if can_favorite?(list)
	end

	def can_favorite?(list)
		(list.public? and list.user != self)
	end
end
