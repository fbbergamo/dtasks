class User < ActiveRecord::Base
  	devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

  	has_many :lists
  	has_many :favorites
	has_many :favorite_lists, through: :favorites, source: :list
end
