class Task < ActiveRecord::Base
	belongs_to :list
	validates_presence_of :list, :text
end
